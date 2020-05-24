# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - gazebo_ros_control."
url='http://ros.org/wiki/gazebo_ros_control'

pkgname='ros-noetic-gazebo-ros-control'
pkgver='2.8.5'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-joint-limits-interface
  ros-noetic-controller-manager
  ros-noetic-transmission-interface
  ros-noetic-hardware-interface
  ros-noetic-std-msgs
  ros-noetic-angles
  ros-noetic-roscpp
  ros-noetic-catkin
  ros-noetic-pluginlib
  ros-noetic-urdf
  ros-noetic-control-toolbox
  ros-noetic-gazebo-dev)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-joint-limits-interface
  ros-noetic-controller-manager
  ros-noetic-hardware-interface
  ros-noetic-std-msgs
  ros-noetic-angles
  ros-noetic-roscpp
  ros-noetic-urdf
  ros-noetic-pluginlib
  ros-noetic-gazebo-ros
  ros-noetic-control-toolbox
  ros-noetic-transmission-interface)
depends=(${ros_depends[@]})

_dir="gazebo_ros_pkgs-${pkgver}/gazebo_ros_control"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-simulation/gazebo_ros_pkgs/archive/${pkgver}.tar.gz")
sha256sums=('0b0f6eeaeca611ebe12ec0ea4388121098fdafee5ecc8d76c6ae69b8b8f14aed')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
