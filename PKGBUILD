# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package contains a tool to convert Unified Robot Description Format (URDF) documents into COLLAborative Design Activity (COLLADA) documents."
url='http://ros.org/wiki/collada_urdf'

pkgname='ros-kinetic-collada-urdf'
pkgver='1.12.12'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-cmake-modules
  ros-kinetic-tf
  ros-kinetic-resource-retriever
  ros-kinetic-urdf
  ros-kinetic-roscpp
  ros-kinetic-collada-parser
  ros-kinetic-geometric-shapes
  ros-kinetic-angles
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  collada-dom
  urdfdom-headers
  urdfdom
  assimp)

ros_depends=(ros-kinetic-tf
  ros-kinetic-resource-retriever
  ros-kinetic-urdf
  ros-kinetic-roscpp
  ros-kinetic-collada-parser
  ros-kinetic-geometric-shapes
  ros-kinetic-angles)
depends=(${ros_depends[@]}
  assimp
  collada-dom
  urdfdom-headers
  urdfdom
  uriparser)

# Git version (e.g. for debugging)
# _tag=release/kinetic/collada_urdf/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/collada_urdf-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="collada_urdf-release-release-kinetic-collada_urdf-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/collada_urdf-release/archive/release/kinetic/collada_urdf/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('b76297ab6e963ffec0426f82afef4289d3cb529d4f59e10991ba2662291c8ab4')

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
