# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Tests for MAVROS package."
url='https://github.com/mavlink/mavros'

pkgname='ros-noetic-test-mavros'
pkgver='0.32.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD, GPLv3, LGPLv3')

ros_makedepends=(ros-noetic-mavros-extras
  ros-noetic-std-msgs
  ros-noetic-eigen-conversions
  ros-noetic-angles
  ros-noetic-roscpp
  ros-noetic-catkin
  ros-noetic-tf2-ros
  ros-noetic-geometry-msgs
  ros-noetic-control-toolbox
  ros-noetic-mavros
  ros-noetic-cmake-modules)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3)

ros_depends=(ros-noetic-mavros-extras
  ros-noetic-mavros
  ros-noetic-eigen-conversions
  ros-noetic-std-msgs
  ros-noetic-roscpp
  ros-noetic-tf2-ros
  ros-noetic-geometry-msgs
  ros-noetic-control-toolbox)
depends=(${ros_depends[@]}
  eigen3)

# Git version (e.g. for debugging)
# _tag=release/noetic/test_mavros/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/mavlink/mavros-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="mavros-${pkgver}/test_mavros"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/mavlink/mavros/archive/${pkgver}.tar.gz")
sha256sums=('d5e04661f88896a9a77f22a083023ce5e8e13dd71c1f8f1b7d5e187b3bf6c4f8')

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
