# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Tutorials showing how to write plugins for RViz."
url='http://ros.org/wiki/rviz_plugin_tutorials'

pkgname='ros-lunar-rviz-plugin-tutorials'
pkgver='0.10.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-catkin
  ros-lunar-rviz)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt5-base)

ros_depends=(ros-lunar-rviz)
depends=(${ros_depends[@]}
  qt5-base)

# Git version (e.g. for debugging)
# _tag=release/lunar/rviz_plugin_tutorials/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/visualization_tutorials-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="visualization_tutorials-release-release-lunar-rviz_plugin_tutorials-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/visualization_tutorials-release/archive/release/lunar/rviz_plugin_tutorials/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('2dec99d78042648ea65de6dd17f48b7505f52af4e595fe02310db1b6f4de8b32')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
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
