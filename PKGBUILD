# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The wiimote package allows ROS nodes to communicate with a Nintendo Wiimote and its related peripherals, including the Nunchuk, Motion Plus, and (experimentally) the Classic."
url='https://wiki.ros.org/wiimote'

pkgname='ros-noetic-wiimote'
pkgver='1.13.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('GPL')

ros_makedepends=(ros-noetic-genmsg
  ros-noetic-std-msgs
  ros-noetic-roscpp
  ros-noetic-catkin
  ros-noetic-roslib
  ros-noetic-std-srvs
  ros-noetic-geometry-msgs
  ros-noetic-roslint
  ros-noetic-sensor-msgs
  ros-noetic-rospy)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  cwiid
  python-numpy)

ros_depends=(ros-noetic-genmsg
  ros-noetic-std-msgs
  ros-noetic-roscpp
  ros-noetic-roslib
  ros-noetic-std-srvs
  ros-noetic-geometry-msgs
  ros-noetic-sensor-msgs
  ros-noetic-rospy)
depends=(${ros_depends[@]}
  cwiid
  python-numpy)

_dir="joystick_drivers-${pkgver}/wiimote"
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
