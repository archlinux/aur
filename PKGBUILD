# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package contains a tool to convert Unified Robot Description Format (URDF) documents into COLLAborative Design Activity (COLLADA) documents."
url='http://ros.org/wiki/collada_urdf'

pkgname='ros-indigo-collada-urdf'
pkgver='1.11.11'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-tf
  ros-indigo-geometric-shapes
  ros-indigo-roscpp
  ros-indigo-resource-retriever
  ros-indigo-angles
  ros-indigo-catkin
  ros-indigo-cmake-modules
  ros-indigo-collada-parser
  ros-indigo-urdf)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  assimp
  collada-dom
  urdfdom
  urdfdom-headers)

ros_depends=(ros-indigo-collada-parser
  ros-indigo-geometric-shapes
  ros-indigo-roscpp
  ros-indigo-resource-retriever
  ros-indigo-angles
  ros-indigo-tf
  ros-indigo-urdf)
depends=(${ros_depends[@]}
  assimp
  collada-dom
  urdfdom
  urdfdom-headers)

# Git version (e.g. for debugging)
# _tag=release/indigo/collada_urdf/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/robot_model-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="robot_model-release-release-indigo-collada_urdf-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/robot_model-release/archive/release/indigo/collada_urdf/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('503d10610d88585a244f1ec8ce6e570c9d2399427730489ca87968dc77082ef7')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
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
