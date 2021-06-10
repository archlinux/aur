# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The OctoMap library implements a 3D occupancy grid mapping approach, providing data structures and mapping algorithms in C++."
url='http://octomap.github.io'

pkgname='ros-noetic-octomap'
pkgver='1.9.6'
arch=('any')
pkgrel=5
license=('BSD')
options=('staticlibs')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-catkin)
depends=(${ros_depends[@]})

_dir="octomap-${pkgver}/octomap"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OctoMap/octomap/archive/v${pkgver}.tar.gz")
sha256sums=('0f88c1c024f0d29ab74c7fb9f6ebfdddc8be725087372c6c4d8878be95831eb6')

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
