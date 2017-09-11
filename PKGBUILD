# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package contains a C++ parser for the Collada robot description format."
url='http://ros.org/wiki/collada_parser'

pkgname='ros-kinetic-collada-parser'
pkgver='1.12.10'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-roscpp
  ros-kinetic-catkin
  ros-kinetic-urdf
  ros-kinetic-urdf-parser-plugin
  ros-kinetic-class-loader)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  collada-dom
  urdfdom-headers)

ros_depends=(ros-kinetic-roscpp
  ros-kinetic-urdf-parser-plugin
  ros-kinetic-class-loader)
depends=(${ros_depends[@]}
  collada-dom
  urdfdom-headers)

# Git version (e.g. for debugging)
# _tag=release/kinetic/collada_parser/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/collada_urdf-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="collada_urdf-release-release-kinetic-collada_parser-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/collada_urdf-release/archive/release/kinetic/collada_parser/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('7458c11868ecfb20b8337f7104f4096afee8b65b845f297754b9df3b30b0ded8')

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
