# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - ROS interface to the 3Dconnexion SpaceNavigator 6DOF joystick."
url='http://www.ros.org/wiki/spacenav_node'

pkgname='ros-indigo-spacenav-node'
pkgver='1.10.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-catkin
  ros-indigo-sensor-msgs
  ros-indigo-roscpp
  ros-indigo-geometry-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  libspnav
  libx11)

ros_depends=(ros-indigo-sensor-msgs
  ros-indigo-roscpp
  ros-indigo-geometry-msgs)
depends=(${ros_depends[@]}
  spacenavd
  libspnav
  libx11)

# Git version (e.g. for debugging)
# _tag=release/indigo/spacenav_node/${pkgver}-${_pkgver_patch}
# _dir=spacenav_node
# source=("${_dir}"::"git+https://github.com/ros-gbp/joystick_drivers-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="joystick_drivers-release-release-indigo-spacenav_node-${pkgver}-${_pkgver_patch}"
source=("https://github.com/ros-gbp/joystick_drivers-release/archive/release/indigo/spacenav_node/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('e96f42eb851aec336358e07fc5a1b5802d1fde8416a08fab273b62ab7b10c745')

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
