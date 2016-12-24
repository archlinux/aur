# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - ROS driver for a generic Linux joystick."
url='http://www.ros.org/wiki/joy'

pkgname='ros-kinetic-joy'
pkgver='1.10.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-diagnostic-updater
  ros-kinetic-roscpp
  ros-kinetic-catkin
  ros-kinetic-sensor-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  linuxconsole)

ros_depends=(ros-kinetic-diagnostic-updater
  ros-kinetic-roscpp
  ros-kinetic-sensor-msgs)
depends=(${ros_depends[@]}
  linuxconsole)

# Git version (e.g. for debugging)
# _tag=release/kinetic/joy/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/joystick_drivers-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="joystick_drivers-release-release-kinetic-joy-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/joystick_drivers-release/archive/release/kinetic/joy/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('c87a083e4e1fe6f219fc4d90ec47baf29fcd471f9906a502276b4831585b38f4')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/kinetic/setup.bash ] && source /opt/ros/kinetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/kinetic \
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
