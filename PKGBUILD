# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Python and C++ interfaces for manipulating geodetic coordinates."
url='http://wiki.ros.org/geodesy'

pkgname='ros-noetic-geodesy'
pkgver='0.5.6'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-uuid-msgs
  ros-noetic-tf
  ros-noetic-geometry-msgs
  ros-noetic-unique-id
  ros-noetic-sensor-msgs
  ros-noetic-geographic-msgs
  ros-noetic-angles
  ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python-catkin_pkg)

ros_depends=(ros-noetic-uuid-msgs
  ros-noetic-tf
  ros-noetic-geometry-msgs
  ros-noetic-unique-id
  ros-noetic-sensor-msgs
  ros-noetic-geographic-msgs)
depends=(${ros_depends[@]}
  python-pyproj)

# Git version (e.g. for debugging)
# _tag=release/noetic/geodesy/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-geographic-info/geographic_info-release.git"#tag=${_tag})
# sha256sums=('0e0e30544c26aba82e9436650848b1442ac5cb4a51157c5acbfdc348d6aadaae')

# Tarball version (faster download)
_dir="geographic_info-release-release-noetic-geodesy"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-geographic-info/geographic_info-release/archive/release/noetic/geodesy/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('362b1ca0f50cbbe53612b6839e1c174f8a7003eb5170c725e0e77ffd7e8bd83e')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.9 \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.9.so \
        -DPYTHON_BASENAME=-python3.9 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
