# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package contains generic definitions of geometric shapes and bodies."
url='http://wiki.ros.org/geometric_shapes'

pkgname='ros-melodic-geometric-shapes'
pkgver='0.5.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-resource-retriever
  ros-melodic-eigen-stl-containers
  ros-melodic-catkin
  ros-melodic-octomap
  ros-melodic-shape-msgs
  ros-melodic-random-numbers
  ros-melodic-visualization-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qhull
  assimp
  eigen3
  boost
  console-bridge
  pkg-config)

ros_depends=(ros-melodic-resource-retriever
  ros-melodic-eigen-stl-containers
  ros-melodic-octomap
  ros-melodic-shape-msgs
  ros-melodic-random-numbers
  ros-melodic-visualization-msgs)
depends=(${ros_depends[@]}
  assimp
  boost
  eigen3
  console-bridge
  qhull)

# Git version (e.g. for debugging)
# _tag=release/melodic/geometric_shapes/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/geometric_shapes-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="geometric_shapes-release-release-melodic-geometric_shapes-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/geometric_shapes-release/archive/release/melodic/geometric_shapes/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('03c5a97f018c9c2634350ac5150a18ee07e0721c08c59743e7c2159e05e71b4b')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
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
