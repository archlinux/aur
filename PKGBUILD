# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package contains generic definitions of geometric shapes and bodies."
url='http://ros.org/wiki/geometric_shapes'

pkgname='ros-jade-geometric-shapes'
pkgver='0.4.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-eigen-stl-containers
  ros-jade-cmake-modules
  ros-jade-octomap
  ros-jade-shape-msgs
  ros-jade-catkin
  ros-jade-resource-retriever
  ros-jade-visualization-msgs
  ros-jade-random-numbers)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qhull
  assimp
  eigen3
  boost
  console-bridge
  pkg-config)

ros_depends=(ros-jade-eigen-stl-containers
  ros-jade-octomap
  ros-jade-shape-msgs
  ros-jade-resource-retriever
  ros-jade-visualization-msgs
  ros-jade-random-numbers)
depends=(${ros_depends[@]}
  assimp
  boost
  eigen3
  console-bridge
  qhull)

# Git version (e.g. for debugging)
# _tag=release/jade/geometric_shapes/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/geometric_shapes-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="geometric_shapes-release-release-jade-geometric_shapes-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/geometric_shapes-release/archive/release/jade/geometric_shapes/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('8d005eaed10fa17bb6fa061b907e7c22d274e552b1fe9925039adc139e6f63fd')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/jade/setup.bash ] && source /opt/ros/jade/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/jade \
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
