# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A multiplexer for command velocity inputs."
url='http://ros.org/wiki/yocs_cmd_vel_mux'

pkgname='ros-kinetic-yocs-cmd-vel-mux'
pkgver='0.8.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-nodelet
  ros-kinetic-geometry-msgs
  ros-kinetic-pluginlib
  ros-kinetic-roscpp
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  yaml-cpp)

ros_depends=(ros-kinetic-nodelet
  ros-kinetic-roscpp
  ros-kinetic-geometry-msgs
  ros-kinetic-pluginlib
  ros-kinetic-dynamic-reconfigure)
depends=(${ros_depends[@]}
  yaml-cpp)

# Git version (e.g. for debugging)
# _tag=release/kinetic/yocs_cmd_vel_mux/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/yujinrobot-release/yujin_ocs-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="yujin_ocs-release-release-kinetic-yocs_cmd_vel_mux-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/yujinrobot-release/yujin_ocs-release/archive/release/kinetic/yocs_cmd_vel_mux/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('ff197e158bd6a94b4991ccf8d2ae752e41c050dbb13792ac13ade322965a35fa')

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
