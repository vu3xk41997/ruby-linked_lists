# Create LinkedList class
class LinkedList

    # check if linked list is empty
    def is_empty?
        if @head == nil
            return true
        else
            return false
        end
    end

    # Adds a new node containing value to the end of the list
    def append(value)
        if self.is_empty?
            @head = Node.new(value)
        else
            current_node = @head
            new_node = Node.new(value)
            while current_node.next != nil
                current_node = current_node.next
            end
            current_node.next = new_node
        end
    end

    # Adds a new node containing value to the beginning of the list
    def prepend(value)
        if self.is_empty?
            @head = Node.new(value)
        else
            current_head = Node.new(value)
            current_head.next = @head
            @head = current_head
        end
    end

    # Returns the total number of nodes in the list
    def size
        if self.is_empty?
            count = 0
        else
            count = 1
            current_node = @head
            while current_node.next != nil
                current_node = current_node.next
                count += 1
            end
        end
        count
    end

    # Returns the first node in the list
    def head
        if self.is_empty?
            puts "This linked list is currently empty."
        else
            current_node = @head
            current_node
        end
    end

    # Returns the last node in the list
    def tail
        if self.is_empty?
            puts "This linked list is currently empty."
        else
            current_node = @head
            while current_node.next != nil
                current_node = current_node.next
            end
            current_node
        end
    end

    # Returns the node at the given index
    def at(index)
        if self.is_empty?
            puts "This linked list is currently empty."
        else
            current_node = @head
            index.times do
                current_node = current_node.next
            end
            current_node
        end
    end

    # Removes the last element from the list
    def pop
        if self.is_empty?
            puts "This linked list is currently empty."
        else
            current_node = @head
            while current_node.next.next != nil
                current_node = current_node.next
            end
            last_node = current_node.next
            current_node.next = nil
        end
    end

    # Returns true if the passed in value is in the list and otherwise returns false.
    def contains?(value)
        if self.is_empty?
            return false
        else
            current_node = @head
            contain = false
            until current_node.nil?
                contain = true if current_node.value == value
                current_node = current_node.next
            end
            contain
        end
    end

    # Returns the index of the node containing value, or nil if not found.
    def find(value)
        if self.is_empty?
            return nil
        else
            current_node = @head
            contain = nil
            count = 0
            until current_node.nil?
                contain = true if current_node.value == value
                current_node = current_node.next
                count += 1 unless contain
            end
        end
        if contain == true
            count
        else
            return nil
        end
    end

    # Represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
    def to_s
        current_node = @head
        if self.is_empty?
            puts "nil"
        else
            until current_node.nil?
                print "( #{current_node.value} ) -> "
                current_node = current_node.next
            end
            puts "nil"
        end
    end
end




# Create Node class
class Node
    
    attr_accessor :value, :next
    
    def initialize(value, next_node = nil)
        @value = value
        @next = next_node
    end
end

# create new linked list
list = LinkedList.new

# p list.is_empty?
list.append("new_node")
list.prepend("another_node")
# p list.size
# p list.head
# p list.tail
# p list.at(0)
# list.pop
list.prepend("third")
list.append("fourth")
# p list.contains?("fifth")
# p list.contains?("third")
# p list.find("another_node")
# p list.find("fifth")
list.to_s