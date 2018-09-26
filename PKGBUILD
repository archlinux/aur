# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - camera_calibration_parsers contains routines for reading and writing camera calibration parameters."
url='http://ros.org/wiki/camera_calibration_parsers'

pkgname='ros-melodic-camera-calibration-parsers'
pkgver='1.11.13'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-rosconsole
  ros-melodic-catkin
  ros-melodic-roscpp
  ros-melodic-sensor-msgs
  ros-melodic-roscpp-serialization)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost
  yaml-cpp
  pkg-config)

ros_depends=(ros-melodic-roscpp
  ros-melodic-sensor-msgs
  ros-melodic-roscpp-serialization)
depends=(${ros_depends[@]}
  boost
  yaml-cpp)

# Git version (e.g. for debugging)
# _tag=release/melodic/camera_calibration_parsers/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/image_common-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="image_common-release-release-melodic-camera_calibration_parsers-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/image_common-release/archive/release/melodic/camera_calibration_parsers/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('dd350061b03da5dba0315515f603daa31204e71c43389cf9e57bf09c06d8d3ef')

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
