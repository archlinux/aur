# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The wiimote package allows ROS nodes to communicate with a Nintendo Wiimote and its related peripherals, including the Nunchuk, Motion Plus, and (experimentally) the Classic."
url='https://www.wiki.ros.org/wiimote'

pkgname='ros-melodic-wiimote'
pkgver='1.14.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('GPL')

ros_makedepends=(ros-melodic-genmsg
  ros-melodic-std-msgs
  ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-roslib
  ros-melodic-std-srvs
  ros-melodic-geometry-msgs
  ros-melodic-roslint
  ros-melodic-sensor-msgs
  ros-melodic-rospy)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  cwiid
  python-numpy)

ros_depends=(ros-melodic-genmsg
  ros-melodic-std-msgs
  ros-melodic-roscpp
  ros-melodic-roslib
  ros-melodic-std-srvs
  ros-melodic-geometry-msgs
  ros-melodic-sensor-msgs
  ros-melodic-rospy)
depends=(${ros_depends[@]}
  cwiid
  python-numpy)

# Git version (e.g. for debugging)
# _tag=release/melodic/wiimote/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/joystick_drivers-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="joystick_drivers-${pkgver}/wiimote"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/joystick_drivers/archive/${pkgver}.tar.gz")
sha256sums=('ee69c4c39f8e863088f44a2a68b3d8e494d03ac3025d2594a55ece57563f11de')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
