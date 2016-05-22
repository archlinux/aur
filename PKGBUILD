# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package allows you to publish the state of a robot to tf."
url='http://wiki.ros.org/robot_state_publisher'

pkgname='ros-indigo-robot-state-publisher'
pkgver='1.11.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-kdl-parser
  ros-indigo-tf2-ros
  ros-indigo-roscpp
  ros-indigo-rostest
  ros-indigo-rostime
  ros-indigo-orocos-kdl
  ros-indigo-catkin
  ros-indigo-rosconsole
  ros-indigo-tf2-kdl
  ros-indigo-sensor-msgs
  ros-indigo-cmake-modules
  ros-indigo-tf)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3)

ros_depends=(ros-indigo-kdl-parser
  ros-indigo-tf2-ros
  ros-indigo-roscpp
  ros-indigo-tf-conversions
  ros-indigo-rostime
  ros-indigo-orocos-kdl
  ros-indigo-catkin
  ros-indigo-rosconsole
  ros-indigo-tf2-kdl
  ros-indigo-sensor-msgs
  ros-indigo-tf)
depends=(${ros_depends[@]}
  eigen3)

# Git version (e.g. for debugging)
# _tag=release/indigo/robot_state_publisher/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/robot_state_publisher-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="robot_state_publisher-release-release-indigo-robot_state_publisher-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/robot_state_publisher-release/archive/release/indigo/robot_state_publisher/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('bba720b6656fc1fa7fd16c8cba803da9c41224965c0c642dff0c86513e35f2df')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
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
