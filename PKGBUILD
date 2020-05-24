# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Provides conversions from PCL data types and ROS message types."
url='https://wiki.ros.org/pcl_conversions'

pkgname='ros-noetic-pcl-conversions'
pkgver='1.7.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-pcl-msgs
  ros-noetic-roscpp
  ros-noetic-sensor-msgs
  ros-noetic-std-msgs)
depends=(${ros_depends[@]}
  eigen3
  pcl)

# Git version (e.g. for debugging)
# _tag=release/noetic/pcl_conversions/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/perception_pcl-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="perception_pcl-${pkgver}/pcl_conversions"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/perception_pcl/archive/${pkgver}.tar.gz")
sha256sums=('ac821a662e507df7e48cebc0ba02aaa360b8edbd43873fc6f63bc65ec3d12628')

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
