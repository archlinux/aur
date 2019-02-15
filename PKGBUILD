# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The wiimote package allows ROS nodes to communicate with a Nintendo Wiimote and its related peripherals, including the Nunchuk, Motion Plus, and (experimentally) the Classic."
url='http://www.ros.org/wiki/wiimote'

pkgname='ros-melodic-wiimote'
pkgver='1.12.0'
_pkgver_patch=0
arch=('any')
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
_dir="joystick_drivers-release-release-melodic-wiimote-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/joystick_drivers-release/archive/release/melodic/wiimote/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('89cc9d0267879d69c478f2d1fafb2462142c7d462c87c9458345b76063654be8')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DPYTHON_BASENAME=.cpython-37m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
