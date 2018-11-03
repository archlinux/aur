# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The nodelet package is designed to provide a way to run multiple algorithms in the same process with zero copy transport between algorithms."
url='http://ros.org/wiki/nodelet'

pkgname='ros-indigo-nodelet'
pkgver='1.9.16'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-roscpp
  ros-indigo-std-msgs
  ros-indigo-bondcpp
  ros-indigo-rospy
  ros-indigo-catkin
  ros-indigo-message-generation
  ros-indigo-rosconsole
  ros-indigo-cmake-modules
  ros-indigo-pluginlib)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  util-linux
  boost
  tinyxml)

ros_depends=(ros-indigo-roscpp
  ros-indigo-bondcpp
  ros-indigo-message-runtime
  ros-indigo-rosconsole
  ros-indigo-std-msgs
  ros-indigo-pluginlib)
depends=(${ros_depends[@]}
  util-linux
  boost
  tinyxml)

# Git version (e.g. for debugging)
# _tag=release/indigo/nodelet/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/nodelet_core-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="nodelet_core-release-release-indigo-nodelet"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/nodelet_core-release/archive/release/indigo/nodelet/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('9256013c9d0c5c101418f08fd82a0bc725b9940df9bdebdb397c638fd3f0d7e5')

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
