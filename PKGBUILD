# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - franka_example_controllers provides example code for controlling Franka Emika research robots with ros_control."
url='h'

pkgname='ros-melodic-franka-example-controllers'
pkgver='0.6.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('Apache 2.0')

ros_makedepends=(
  ros-melodic-message-generation
  ros-melodic-franka-hw
  ros-melodic-controller-interface
  ros-melodic-geometry-msgs
  ros-melodic-hardware-interface
  ros-melodic-realtime-tools
  ros-melodic-roscpp
  ros-melodic-libfranka
  ros-melodic-dynamic-reconfigure
  ros-melodic-pluginlib
  ros-melodic-catkin
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen
)

ros_depends=(
  ros-melodic-franka-hw
  ros-melodic-franka-control
  ros-melodic-franka-description
  ros-melodic-panda-moveit-config
  ros-melodic-rospy
  ros-melodic-controller-interface
  ros-melodic-geometry-msgs
  ros-melodic-hardware-interface
  ros-melodic-pluginlib
  ros-melodic-realtime-tools
  ros-melodic-roscpp
  ros-melodic-libfranka
  ros-melodic-dynamic-reconfigure
  ros-melodic-message-runtime
)

depends=(
  ${ros_depends[@]}
)

_dir="franka_ros-release-release-melodic-franka_example_controllers"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/frankaemika/franka_ros-release/archive/release/melodic/franka_example_controllers/${pkgver}.tar.gz")
sha256sums=('15b054d83e5afcdc04d9ae8ff7852010ce1089f282700de8f2a4d0b1d8ed24af')


build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCATKIN_BUILD_BINARY_PACKAGE=ON \
    -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
    -DPYTHON_EXECUTABLE=/usr/bin/python3 \
    -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
