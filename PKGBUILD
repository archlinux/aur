# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A rosout GUI viewer developed at Southwest Research Insititute as an alternative to rqt_console."
url='http://ros.org/wiki/swri_console'

pkgname='ros-noetic-swri-console'
pkgver='1.1.0'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-noetic-rosgraph-msgs
  ros-noetic-roscpp
  ros-noetic-rosbag-storage
  ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost
  qt5-base)

ros_depends=(ros-noetic-rosgraph-msgs
  ros-noetic-roscpp
  ros-noetic-rosbag-storage)
depends=(${ros_depends[@]}
  boost
  qt5-base)

# Git version (e.g. for debugging)
# _tag=release/noetic/swri_console/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/swri-robotics-gbp/swri_console-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="swri_console-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/swri-robotics/swri_console/archive/${pkgver}.tar.gz")
sha256sums=('da27e4f92247ce7016a4325ef7ffea0ed18fa6fe671ce0b7f17652778ce9481c')

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
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
