# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This metapackage depends on packages for interfacing common joysticks and human input devices with ROS."
url='http://www.ros.org/wiki/joystick_drivers'

pkgname='ros-indigo-joystick-drivers'
pkgver='1.10.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-joy
  ros-indigo-spacenav-node
  ros-indigo-ps3joy
  ros-indigo-wiimote)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/joystick_drivers/${pkgver}-${_pkgver_patch}
# _dir=joystick_drivers
# source=("${_dir}"::"git+https://github.com/ros-gbp/joystick_drivers-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="joystick_drivers-release-release-indigo-joystick_drivers-${pkgver}-${_pkgver_patch}"
source=("https://github.com/ros-gbp/joystick_drivers-release/archive/release/indigo/joystick_drivers/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('b6fcc4e0b7e1984c8e3514728e455d5a5b81e1232a53080867e4c958a37d38e4')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
