# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Some fast/convenient type converters, mostly for char strings or strings."
url='http://wiki.ros.org/ecl_converters'

pkgname='ros-kinetic-ecl-converters'
pkgver='0.61.17'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-ecl-license
  ros-kinetic-ecl-mpl
  ros-kinetic-ecl-type-traits
  ros-kinetic-ecl-errors
  ros-kinetic-ecl-config
  ros-kinetic-ecl-concepts
  ros-kinetic-ecl-exceptions
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-ecl-license
  ros-kinetic-ecl-mpl
  ros-kinetic-ecl-type-traits
  ros-kinetic-ecl-errors
  ros-kinetic-ecl-config
  ros-kinetic-ecl-concepts
  ros-kinetic-ecl-exceptions)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/ecl_converters/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/yujinrobot-release/ecl_core-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ecl_core-release-release-kinetic-ecl_converters-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/yujinrobot-release/ecl_core-release/archive/release/kinetic/ecl_converters/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('88b6bc078843e94363cd3888a84c16d38d0c5ac077b46fe714a8ae73da054e46')

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
