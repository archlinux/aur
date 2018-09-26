# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Assorted filters designed to operate on 2D planar laser scanners, which use the sensor_msgs/LaserScan type."
url='http://ros.org/wiki/laser_filters'

pkgname='ros-melodic-laser-filters'
pkgver='1.8.6'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-tf
  ros-melodic-rostest
  ros-melodic-angles
  ros-melodic-roscpp
  ros-melodic-laser-geometry
  ros-melodic-catkin
  ros-melodic-pluginlib
  ros-melodic-filters
  ros-melodic-message-filters
  ros-melodic-sensor-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-tf
  ros-melodic-angles
  ros-melodic-roscpp
  ros-melodic-laser-geometry
  ros-melodic-pluginlib
  ros-melodic-filters
  ros-melodic-message-filters
  ros-melodic-sensor-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/laser_filters/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/laser_filters-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="laser_filters-release-release-melodic-laser_filters-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/laser_filters-release/archive/release/melodic/laser_filters/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('7429472a08b080cae1e101e9e96443b884791926ad59479c553809669347d46e')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DPYTHON_BASENAME=.cpython-37m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
