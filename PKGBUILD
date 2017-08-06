# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package contains a tool to convert Unified Robot Description Format (URDF) documents into COLLAborative Design Activity (COLLADA) documents."
url='http://ros.org/wiki/collada_urdf'

pkgname='ros-lunar-collada-urdf'
pkgver='1.12.10'
_pkgver_patch=2
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-lunar-catkin
  ros-lunar-roscpp
  ros-lunar-resource-retriever
  ros-lunar-tf
  ros-lunar-collada-parser
  ros-lunar-angles
  ros-lunar-urdf
  ros-lunar-cmake-modules
  ros-lunar-geometric-shapes)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  assimp
  collada-dom
  urdfdom
  urdfdom-headers)

ros_depends=(ros-lunar-roscpp
  ros-lunar-resource-retriever
  ros-lunar-tf
  ros-lunar-collada-parser
  ros-lunar-angles
  ros-lunar-urdf
  ros-lunar-geometric-shapes)
depends=(${ros_depends[@]}
  assimp
  collada-dom
  urdfdom
  urdfdom-headers)

# Git version (e.g. for debugging)
# _tag=release/lunar/collada_urdf/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/collada_urdf-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="collada_urdf-release-release-lunar-collada_urdf-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/collada_urdf-release/archive/release/lunar/collada_urdf/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('1942ac13908a30ab9db831f4fc57b7f463c0ac4617f77183a740e036392a0200')

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
