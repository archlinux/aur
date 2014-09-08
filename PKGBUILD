# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Assorted filters designed to operate on 2D planar laser scanners, which use the sensor_msgs/LaserScan type."
url='http://ros.org/wiki/laser_filters'

pkgname='ros-indigo-laser-filters'
pkgver='1.7.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-roscpp
  ros-indigo-rostest
  ros-indigo-sensor-msgs
  ros-indigo-angles
  ros-indigo-catkin
  ros-indigo-laser-geometry
  ros-indigo-filters
  ros-indigo-cmake-modules
  ros-indigo-tf
  ros-indigo-message-filters
  ros-indigo-pluginlib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3)

ros_depends=(ros-indigo-roscpp
  ros-indigo-sensor-msgs
  ros-indigo-angles
  ros-indigo-laser-geometry
  ros-indigo-filters
  ros-indigo-cmake-modules
  ros-indigo-tf
  ros-indigo-message-filters
  ros-indigo-pluginlib)
depends=(${ros_depends[@]}
  eigen3)

_tag=release/indigo/laser_filters/${pkgver}-${_pkgver_patch}
_dir=laser_filters
source=("${_dir}"::"git+https://github.com/ros-gbp/laser_filters-release.git"#tag=${_tag})
md5sums=('SKIP')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
