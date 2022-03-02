# Maintainer: DanielNak <daniel@tee.cat>

pkgname=ros-noetic-mbf-costmap-core
pkgver=0.3.4
pkgdesc="ROS - A Highly Flexible Navigation Framework."
url='http://wiki.ros.org/move_base_flex/mbf_costmap_core'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
  ros-noetic-tf
  ros-noetic-nav-core
  ros-noetic-mbf-utility
  ros-noetic-mbf-abstract-core
  ros-noetic-costmap-2d
  ros-noetic-std-msgs
  ros-noetic-geometry-msgs
  ros-noetic-catkin
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-noetic-tf
  ros-noetic-nav-core
  ros-noetic-mbf-utility
  ros-noetic-mbf-abstract-core
  ros-noetic-costmap-2d
  ros-noetic-std-msgs
  ros-noetic-geometry-msgs
)

depends=(
  ${ros_depends[@]}
)

# Tarball version (faster download)
_dir="move_base_flex-release-release-noetic-mbf_costmap_core"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/uos-gbp/move_base_flex-release/archive/release/noetic/mbf_costmap_core/${pkgver}.tar.gz")
sha256sums=('0c1f3874d19db615328306a36c4e2709514df4117b14782e88378618e590f35b')

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
