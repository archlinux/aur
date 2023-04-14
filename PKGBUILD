# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
# Maintainer: Fan Jiang <i@fanjiang.me>
# Contributor: Sean Greenslade <aur@seangreenslade.com>
pkgdesc="ROS - OMPL is a free sampling-based motion planning library."
url='https://ompl.kavrakilab.org'

pkgname='ros-noetic-ompl'
pkgver='1.6.0'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost
  eigen)

ros_depends=()
depends=(${ros_depends[@]}
  boost
  eigen)

_dir="ompl-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ompl/ompl/archive/${pkgver}.tar.gz")
sha256sums=('f03daa95d2bbf1c21e91a38786242c245f4740f16aa9e9adbf7c7e0236e3c625')

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
