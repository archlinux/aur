# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - turtlebot_actions provides several basic actionlib actions for the TurtleBot."
url='http://ros.org/wiki/turtlebot_actions'

pkgname='ros-indigo-turtlebot-actions'
pkgver='2.3.7'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-image-geometry
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-cv-bridge
  ros-indigo-catkin
  ros-indigo-message-generation
  ros-indigo-actionlib
  ros-indigo-actionlib-msgs
  ros-indigo-cmake-modules
  ros-indigo-tf
  ros-indigo-image-transport)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3)

ros_depends=(ros-indigo-image-geometry
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-cv-bridge
  ros-indigo-message-runtime
  ros-indigo-image-transport
  ros-indigo-actionlib
  ros-indigo-actionlib-msgs
  ros-indigo-tf
  ros-indigo-turtlebot-bringup)
depends=(${ros_depends[@]}
  eigen3)

# Git version (e.g. for debugging)
# _tag=release/indigo/turtlebot_actions/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/turtlebot-release/turtlebot_apps-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="turtlebot_apps-release-release-indigo-turtlebot_actions-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/turtlebot-release/turtlebot_apps-release/archive/release/indigo/turtlebot_actions/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('63efc4dfcd9d545aaa8a8d76f3311235c408e47400ce473473207cc8fa686880')

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
