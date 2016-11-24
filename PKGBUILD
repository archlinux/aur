# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The core set of turtlebot app manager apps are defined in this package."
url='http://ros.org/wiki/turtlebot_rapps'

pkgname='ros-indigo-turtlebot-rapps'
pkgver='2.3.7'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-world-canvas-server
  ros-indigo-robot-pose-publisher
  ros-indigo-tf
  ros-indigo-compressed-image-transport
  ros-indigo-turtlebot-teleop
  ros-indigo-turtlebot-follower
  ros-indigo-turtlebot-bringup
  ros-indigo-topic-tools
  ros-indigo-warehouse-ros
  ros-indigo-turtlebot-navigation
  ros-indigo-kobuki-auto-docking)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/turtlebot_rapps/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/turtlebot-release/turtlebot_apps-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="turtlebot_apps-release-release-indigo-turtlebot_rapps-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/turtlebot-release/turtlebot_apps-release/archive/release/indigo/turtlebot_rapps/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('d7e8662cb04258f3e440ae51ab81f5f7f882d863d40fd1b5adb1c3d632fc64f5')

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
