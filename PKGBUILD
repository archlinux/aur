# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - turtlebot_apps is a group of simple demos and exmaples to run on your TurtleBot to help you get started with ROS and TurtleBot."
url='http://ros.org/wiki/turtlebot_apps'

pkgname='ros-indigo-turtlebot-apps'
pkgver='2.3.7'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-turtlebot-navigation
  ros-indigo-turtlebot-actions
  ros-indigo-turtlebot-rapps
  ros-indigo-turtlebot-calibration
  ros-indigo-turtlebot-follower)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/turtlebot_apps/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/turtlebot-release/turtlebot_apps-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="turtlebot_apps-release-release-indigo-turtlebot_apps-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/turtlebot-release/turtlebot_apps-release/archive/release/indigo/turtlebot_apps/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('6c25c79e26ada9da5ba6e9f985e4f7e6511393c2c8bcbb7b35d3476d2636a0ef')

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
