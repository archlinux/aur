# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package allows you to publish the state of a robot to tf."
url='http://wiki.ros.org/robot_state_publisher'

pkgname='ros-kinetic-robot-state-publisher'
pkgver='1.13.6'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-tf2-kdl
  ros-kinetic-tf
  ros-kinetic-rostime
  ros-kinetic-orocos-kdl
  ros-kinetic-roscpp
  ros-kinetic-sensor-msgs
  ros-kinetic-kdl-parser
  ros-kinetic-tf2-ros
  ros-kinetic-rosconsole
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  urdfdom-headers
  eigen)

ros_depends=(ros-kinetic-tf2-kdl
  ros-kinetic-tf
  ros-kinetic-rostime
  ros-kinetic-orocos-kdl
  ros-kinetic-roscpp
  ros-kinetic-sensor-msgs
  ros-kinetic-kdl-parser
  ros-kinetic-tf2-ros
  ros-kinetic-rosconsole
  ros-kinetic-catkin)
depends=(${ros_depends[@]}
  eigen)

# Git version (e.g. for debugging)
# _tag=release/kinetic/robot_state_publisher/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/robot_state_publisher-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="robot_state_publisher-release-release-kinetic-robot_state_publisher-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/robot_state_publisher-release/archive/release/kinetic/robot_state_publisher/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('ae537f55c5810827d787830e3c2852390749c6053281ea7264e2f040f3602d00')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/kinetic/setup.bash ] && source /opt/ros/kinetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/kinetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
