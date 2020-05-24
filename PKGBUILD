# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Generic keyboard teleop for twist robots."
url='https://wiki.ros.org/teleop_twist_keyboard'

pkgname='ros-noetic-teleop-twist-keyboard'
pkgver='0.6.2'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-geometry-msgs
  ros-noetic-rospy)
depends=(${ros_depends[@]})

_dir="teleop_twist_keyboard-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-teleop/teleop_twist_keyboard/archive/${pkgver}.tar.gz")
sha256sums=('7c0c2c0ef2f47e52922beeac94c093b54677318397b4415ac78933aca5079b0c')

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
