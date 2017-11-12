# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - C++ implementation of bond, a mechanism for checking when another process has terminated."
url='http://www.ros.org/wiki/bondcpp'

pkgname='ros-lunar-bondcpp'
pkgver='1.8.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-catkin
  ros-lunar-cmake-modules)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-lunar-roscpp
  ros-lunar-smclib
  ros-lunar-bond)
depends=(${ros_depends[@]}
  util-linux
  boost)

ros_checkdepends=()
checkdepends=(${ros_checkdepends[@]})

# Git version (e.g. for debugging)
# _tag=release/lunar/bondcpp/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/bond_core-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="bond_core-release-release-lunar-bondcpp-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/bond_core-release/archive/release/lunar/bondcpp/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('73d4b020be594afd91233dbffcb1b7934123fce3e648d37d348394cb2a148e74')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DCATKIN_ENABLE_TESTING=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
