# encoding: utf-8
module Paperclip
  module TableColumns
    def paperclip(*names)
      options = names.extract_options!
      names.each do |name|
        string   "#{name}_file_name", "#{name}_content_type"
        integer  "#{name}_file_size"
        datetime "#{name}_updated_at"
        integer  "#{name}_width", "#{name}_height" unless options[:no_dimensions]
      end
    end

    def remove_paperclip(*names)
      options = names.extract_options!
      names.each do |name|
        remove  "#{name}_file_name", "#{name}_content_type", "#{name}_file_size", "#{name}_updated_at"
        remove "#{name}_width", "#{name}_height" unless options[:no_dimensions]
      end
    end
  end
end
