# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - camera_calibration_parsers contains routines for reading and writing camera calibration parameters."
url='http://ros.org/wiki/camera_calibration_parsers'

pkgname='ros-kinetic-camera-calibration-parsers'
pkgver='1.11.13'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-roscpp
  ros-kinetic-roscpp-serialization
  ros-kinetic-catkin
  ros-kinetic-rosconsole
  ros-kinetic-sensor-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost
  yaml-cpp
  pkg-config)

ros_depends=(ros-kinetic-roscpp
  ros-kinetic-roscpp-serialization
  ros-kinetic-sensor-msgs)
depends=(${ros_depends[@]}
  boost
  yaml-cpp)

# Git version (e.g. for debugging)
# _tag=release/kinetic/camera_calibration_parsers/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/image_common-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="image_common-release-release-kinetic-camera_calibration_parsers-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/image_common-release/archive/release/kinetic/camera_calibration_parsers/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('f3b555d2f8d8b7b223ae61f8b14237e1adeeb999a691bc9b4165383a2b1da69f')

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
