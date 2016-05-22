# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This unary stack contains the dynamic_reconfigure package which provides a means to change node parameters at any time without having to restart the node."
url='http://ros.org/wiki/dynamic_reconfigure'

pkgname='ros-jade-dynamic-reconfigure'
pkgver='1.5.43'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-rostest
  ros-jade-std-msgs
  ros-jade-message-generation
  ros-jade-roscpp
  ros-jade-catkin
  ros-jade-roscpp-serialization)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost)

ros_depends=(ros-jade-roslib
  ros-jade-std-msgs
  ros-jade-message-runtime
  ros-jade-roscpp
  ros-jade-rosservice
  ros-jade-rospy)
depends=(${ros_depends[@]}
  boost)

# Git version (e.g. for debugging)
# _tag=release/jade/dynamic_reconfigure/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/dynamic_reconfigure-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="dynamic_reconfigure-release-release-jade-dynamic_reconfigure-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/dynamic_reconfigure-release/archive/release/jade/dynamic_reconfigure/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('ceb3883ecef91c36137dd231286546f6829e5c88ad4815c85d8379a9b96445d2')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/jade/setup.bash ] && source /opt/ros/jade/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/jade \
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
