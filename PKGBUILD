# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Python and C++ interfaces for manipulating geodetic coordinates."
url='http://wiki.ros.org/geodesy'

pkgname='ros-lunar-geodesy'
pkgver='0.5.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-catkin
  ros-lunar-tf
  ros-lunar-uuid-msgs
  ros-lunar-angles
  ros-lunar-unique-id
  ros-lunar-geometry-msgs
  ros-lunar-geographic-msgs
  ros-lunar-sensor-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2-catkin_pkg)

ros_depends=(ros-lunar-tf
  ros-lunar-uuid-msgs
  ros-lunar-unique-id
  ros-lunar-geometry-msgs
  ros-lunar-geographic-msgs
  ros-lunar-sensor-msgs)
depends=(${ros_depends[@]}
  python2-pyproj)

# Git version (e.g. for debugging)
# _tag=release/lunar/geodesy/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-geographic-info/geographic_info-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="geographic_info-release-release-lunar-geodesy-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-geographic-info/geographic_info-release/archive/release/lunar/geodesy/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('8336ff81fc496e1cc2e3c1cd570c210f3e96fb1d6f093cffa5f6d9ddb47c32d0')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 "${srcdir}/${_dir}"

  # Build project
  cmake "${srcdir}/${_dir}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/lunar \
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
