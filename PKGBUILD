# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package provides a C++ interface for camera calibration information."
url='http://ros.org/wiki/camera_info_manager'

pkgname='ros-kinetic-camera-info-manager'
pkgver='1.11.13'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-camera-calibration-parsers
  ros-kinetic-roscpp
  ros-kinetic-sensor-msgs
  ros-kinetic-image-transport
  ros-kinetic-roslib
  ros-kinetic-rostest
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost)

ros_depends=(ros-kinetic-image-transport
  ros-kinetic-roscpp
  ros-kinetic-sensor-msgs
  ros-kinetic-camera-calibration-parsers
  ros-kinetic-roslib)
depends=(${ros_depends[@]}
  boost)

# Git version (e.g. for debugging)
# _tag=release/kinetic/camera_info_manager/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/image_common-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="image_common-release-release-kinetic-camera_info_manager-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/image_common-release/archive/release/kinetic/camera_info_manager/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('99173c8c962cf3339d30b7453a9e59fed2e36ab0b66de3197ea97d7d553d1646')

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
