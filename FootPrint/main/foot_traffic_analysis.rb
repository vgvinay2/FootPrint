class FootTrafficAnalysis

  attr_accessor :log_file

  def initialize(log_file)
    p log_file  # got file name
    @log_file = log_file   
    @log_entries = 0
  end

  def process_logs
    lines = File.open(log_file).collect(&:chomp)# got file in an array ["4", "0 0 I 540", "1 0 I 540", "0 0 O 560", "1 0 O 560"]
    @log_entries = lines.shift # got number of times ex: 4 and  line array remove first element
    @galary = Galary.new
    @log_entries.to_i.times do |t|
      @galary.add_or_update_log(lines[t]) # passing array to gallary
    end
  end

  def report
    process_logs
    @galary.rooms = @galary.rooms.sort_by{|u| u.index.to_i }   
    @galary.rooms.each do |room|
      puts "Room #{room.index}, #{room.avarage_visitor_time} minute average visit, #{room.total_visitors} visitor(s) total" 
    end
  end
 
end
