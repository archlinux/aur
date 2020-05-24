# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Playstation 3 SIXAXIS or DUAL SHOCK 3 joystick driver."
url='http://www.ros.org/wiki/ps3joy'

pkgname='ros-noetic-ps3joy'
pkgver='1.13.0'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-noetic-diagnostic-msgs
  ros-noetic-rosgraph
  ros-noetic-catkin
  ros-noetic-sensor-msgs
  ros-noetic-rospy)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  linuxconsole
  bluez
  python-pybluez
  libusb-compat)

ros_depends=(ros-noetic-diagnostic-msgs
  ros-noetic-rosgraph
  ros-noetic-sensor-msgs
  ros-noetic-rospy)
depends=(${ros_depends[@]}
  linuxconsole
  bluez
  python-pybluez
  libusb-compat)

# Git version (e.g. for debugging)
# _tag=release/noetic/ps3joy/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/joystick_drivers-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="joystick_drivers-${pkgver}/ps3joy"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/joystick_drivers/archive/${pkgver}.tar.gz")
sha256sums=('bfe0633623f4dc917524198aaea10b1c4603881e736dafb7b652f1af60922ad7')

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
