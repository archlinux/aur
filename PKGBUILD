# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Assorted filters designed to operate on 2D planar laser scanners, which use the sensor_msgs/LaserScan type."
url='http://ros.org/wiki/laser_filters'

pkgname='ros-jade-laser-filters'
pkgver='1.8.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-filters
  ros-jade-cmake-modules
  ros-jade-rostest
  ros-jade-sensor-msgs
  ros-jade-roscpp
  ros-jade-catkin
  ros-jade-tf
  ros-jade-message-filters
  ros-jade-pluginlib
  ros-jade-laser-geometry
  ros-jade-angles)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-jade-filters
  ros-jade-cmake-modules
  ros-jade-sensor-msgs
  ros-jade-roscpp
  ros-jade-tf
  ros-jade-message-filters
  ros-jade-pluginlib
  ros-jade-laser-geometry
  ros-jade-angles)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/jade/laser_filters/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/laser_filters-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="laser_filters-release-release-jade-laser_filters-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/laser_filters-release/archive/release/jade/laser_filters/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('e38aa3d60a21882fdd589800efd04c87b8da8c7cba3d534f70e37d5cd254277d')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/jade/setup.bash ] && source /opt/ros/jade/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/jade \
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
