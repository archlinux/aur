pkgdesc="A metapackage for all Franka Emika ROS packages"
pkgbase="ros-noetic-franka-ros"
pkgname=(
    'ros-noetic-franka-control'
    'ros-noetic-franka-example-controllers'
    'ros-noetic-franka-gazebo'
    'ros-noetic-franka-gripper'
    'ros-noetic-franka-hw'
    'ros-noetic-franka-msgs'
    'ros-noetic-franka-ros'
    'ros-noetic-franka-visualization'
)
pkgver="0.9.0"
pkgrel=2
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="http://wiki.ros.org/franka_ros"
license=('Apache 2.0')

makedepends=(
    ros-build-tools
    cmake
    ros-noetic-catkin
    ros-noetic-message-generation
    eigen
    ros-noetic-message-runtime
    ros-noetic-gazebo-dev
)

source=("franka_ros-$pkgver.tar.gz::https://github.com/frankaemika/franka_ros/archive/$pkgver.tar.gz")
sha256sums=("e1858ed46bcc56bb336fd0e1bd1f9de6870a4313d130430bbefdef3ab4d0c991")


build() {
	# Use ROS environment variables
  	source /usr/share/ros-build-tools/clear-ros-env.sh
  	[ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    catkin_make_isolated \
        --directory ${srcdir} \
        --source ${srcdir}/franka_ros-${pkgver} \
        --install-space /opt/ros/noetic \
        --cmake-args \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
}


package_ros-noetic-franka-ros() {
    depends=(
        ros-noetic-franka-control
        ros-noetic-franka-description
        ros-noetic-franka-example-controllers
        ros-noetic-franka-gripper
        ros-noetic-franka-hw
        ros-noetic-franka-msgs
        ros-noetic-franka-visualization
        ros-noetic-franka-gazebo
    )

    cd "${srcdir}/build_isolated/franka_ros"
    make DESTDIR="${pkgdir}/" install
}


package_ros-noetic-franka-control() {
    pkgdesc="franka_control provides a hardware node to control a Franka Emika research robot"
    url='https://wiki.ros.org/franka_control'
    depends=(
        ros-noetic-libfranka
        ros-noetic-controller-interface
        ros-noetic-controller-manager
        ros-noetic-franka-hw
        ros-noetic-franka-msgs
        ros-noetic-geometry-msgs
        ros-noetic-pluginlib
        ros-noetic-realtime-tools
        ros-noetic-roscpp
        ros-noetic-sensor-msgs
        ros-noetic-tf2-msgs
        ros-noetic-tf
        ros-noetic-std-srvs
        ros-noetic-franka-description
        ros-noetic-franka-gripper
        ros-noetic-joint-state-publisher
        ros-noetic-joint-trajectory-controller
        ros-noetic-robot-state-publisher
    )
    cd "${srcdir}/build_isolated/franka_control"
    make DESTDIR="${pkgdir}/" install
}


package_ros-noetic-franka-example-controllers() {
    pkgdesc="franka_example_controllers provides example code for controlling Franka Emika research robots with ros_control"
    url='https://wiki.ros.org/franka_example_controllers'
    depends=(
        ros-noetic-controller-interface
        ros-noetic-dynamic-reconfigure
        ros-noetic-eigen-conversions
        ros-noetic-franka-hw
        ros-noetic-geometry-msgs
        ros-noetic-hardware-interface
        ros-noetic-tf
        ros-noetic-tf-conversions
        ros-noetic-libfranka
        ros-noetic-pluginlib
        ros-noetic-realtime-tools
        ros-noetic-roscpp
        ros-noetic-franka-control
        ros-noetic-franka-description
        ros-noetic-message-runtime
        ros-noetic-panda-moveit-config
        ros-noetic-moveit-commander
        ros-noetic-rospy
    )
    cd "${srcdir}/build_isolated/franka_example_controllers"
    make DESTDIR="${pkgdir}/" install
}

package_ros-noetic-franka-gazebo() {
    pkgdesc="This package offers the FrankaHWSim Class to simulate a Franka Robot in Gazebo"
    url='https://wiki.ros.org/franka_gazebo'
    depends=(
        ros-noetic-gazebo-ros
        ros-noetic-gazebo-ros-control
        ros-noetic-roscpp
        ros-noetic-std-msgs
        ros-noetic-control-msgs
        ros-noetic-control-toolbox
        ros-noetic-controller-manager
        ros-noetic-controller-interface
        ros-noetic-pluginlib
        ros-noetic-kdl-parser
        ros-noetic-hardware-interface
        ros-noetic-transmission-interface
        ros-noetic-joint-limits-interface
        ros-noetic-eigen-conversions
        ros-noetic-franka-hw
        ros-noetic-franka-msgs
        ros-noetic-franka-gripper
        ros-noetic-franka-example-controllers
        ros-noetic-urdf
        ros-noetic-angles
        ros-noetic-rospy
        ros-noetic-roslaunch
    )
    cd "${srcdir}/build_isolated/franka_gazebo"
    make DESTDIR="${pkgdir}/" install
}

package_ros-noetic-franka-gripper() {
    pkgdesc="This package implements the franka gripper of type Franka Hand for the use in ros"
    url='https://wiki.ros.org/franka_gripper'
    depends=(
        ros-noetic-roscpp
        ros-noetic-message-generation
        ros-noetic-libfranka
        ros-noetic-control-msgs
        ros-noetic-actionlib
        ros-noetic-sensor-msgs
        ros-noetic-xmlrpcpp
        ros-noetic-actionlib-msgs
        ros-noetic-message-runtime
    )
    cd "${srcdir}/build_isolated/franka_gripper"
    make DESTDIR="${pkgdir}/" install
}

package_ros-noetic-franka-hw() {
    pkgdesc="franka_hw provides hardware interfaces for using Franka Emika research robots with ros_control"
    url='https://wiki.ros.org/franka_hw'
    depends=(
        ros-noetic-actionlib-msgs
        ros-noetic-actionlib
        ros-noetic-controller-interface
        ros-noetic-combined-robot-hw
        ros-noetic-hardware-interface
        ros-noetic-joint-limits-interface
        ros-noetic-libfranka
        ros-noetic-roscpp
        ros-noetic-std-srvs
        ros-noetic-urdf
        ros-noetic-pluginlib
        ros-noetic-franka-msgs
    )
    cd "${srcdir}/build_isolated/franka_hw"
    make DESTDIR="${pkgdir}/" install
}

package_ros-noetic-franka-msgs() {
    pkgdesc="franka_msgs provides messages specific to Franka Emika research robots"
    url='https://wiki.ros.org/franka_msgs'
    depends=(
        ros-noetic-std-msgs
        ros-noetic-actionlib-msgs
        ros-noetic-message-runtime
    )
    cd "${srcdir}/build_isolated/franka_msgs"
    make DESTDIR="${pkgdir}/" install
}

package_ros-noetic-franka-visualization() {
    pkgdesc="This package contains visualization tools for Franka Emika."
    url='https://wiki.ros.org/franka_visualization'
    depends=(
        ros-noetic-sensor-msgs
        ros-noetic-roscpp
        ros-noetic-libfranka
        ros-noetic-franka-description
        ros-noetic-xacro
    )
    cd "${srcdir}/build_isolated/franka_visualization"
    make DESTDIR="${pkgdir}/" install
}
