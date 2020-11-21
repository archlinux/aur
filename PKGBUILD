# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Python and C++ interfaces for manipulating geodetic coordinates."
url='http://wiki.ros.org/geodesy'

pkgname='ros-melodic-geodesy'
pkgver='0.5.3'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-uuid-msgs
  ros-melodic-tf
  ros-melodic-geometry-msgs
  ros-melodic-unique-id
  ros-melodic-sensor-msgs
  ros-melodic-geographic-msgs
  ros-melodic-angles
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python-catkin_pkg)

ros_depends=(ros-melodic-uuid-msgs
  ros-melodic-tf
  ros-melodic-geometry-msgs
  ros-melodic-unique-id
  ros-melodic-sensor-msgs
  ros-melodic-geographic-msgs)
depends=(${ros_depends[@]}
  python-pyproj)

# Git version (e.g. for debugging)
# _tag=release/melodic/geodesy/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-geographic-info/geographic_info-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="geographic_info-release-release-melodic-geodesy-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-geographic-info/geographic_info-release/archive/release/melodic/geodesy/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('58e20388e22a583385b39acf097e80a508617623d484f29a30f31ee96558f58b')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.8.so \
        -DPYTHON_BASENAME=-python3.8 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
