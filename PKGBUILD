# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - turtlebot_navigation."
url='http://ros.org/wiki/turtlebot_navigation'

pkgname='ros-indigo-turtlebot-navigation'
pkgver='2.3.7'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-catkin
  ros-indigo-tf
  ros-indigo-roscpp
  ros-indigo-sensor-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-map-server
  ros-indigo-roscpp
  ros-indigo-amcl
  ros-indigo-gmapping
  ros-indigo-dwa-local-planner
  ros-indigo-turtlebot-bringup
  ros-indigo-sensor-msgs
  ros-indigo-tf
  ros-indigo-move-base)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/turtlebot_navigation/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/turtlebot-release/turtlebot_apps-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="turtlebot_apps-release-release-indigo-turtlebot_navigation-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/turtlebot-release/turtlebot_apps-release/archive/release/indigo/turtlebot_navigation/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('0475fa2fa81f5677e5fc5855f35dbb9d534a2096637438008d3e1e6c3f1f04b5')

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
