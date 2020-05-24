# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package contains generic definitions of geometric shapes and bodies."
url='http://wiki.ros.org/geometric_shapes'

pkgname='ros-noetic-geometric-shapes'
pkgver='0.6.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-noetic-resource-retriever
  ros-noetic-eigen-stl-containers
  ros-noetic-catkin
  ros-noetic-octomap
  ros-noetic-shape-msgs
  ros-noetic-random-numbers
  ros-noetic-visualization-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qhull
  assimp
  eigen3
  boost
  console-bridge
  pkg-config)

ros_depends=(ros-noetic-resource-retriever
  ros-noetic-eigen-stl-containers
  ros-noetic-octomap
  ros-noetic-shape-msgs
  ros-noetic-random-numbers
  ros-noetic-visualization-msgs)
depends=(${ros_depends[@]}
  assimp
  boost
  eigen3
  console-bridge
  qhull)

_dir="geometric_shapes-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/geometric_shapes/archive/${pkgver}.tar.gz")
sha256sums=('768ecbd9bf8501a844b358026d6ae1db5d4d70d1958f47f5ca64c1ee7bd20b8c')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
