# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Low-level build system macros and infrastructure for ROS."
url='http://www.ros.org/wiki/catkin'

pkgname='ros-indigo-catkin'
pkgver='0.6.9'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=()
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2-catkin_pkg
  python2-empy
  python2)

ros_depends=()
depends=(${ros_depends[@]}
  gtest
  python2-nose
  python2-catkin_pkg
  python2-empy
  python2)

_tag=release/indigo/catkin/${pkgver}-${_pkgver_patch}
_dir=catkin
source=("${_dir}"::"git+https://github.com/ros-gbp/catkin-release.git"#tag=${_tag})
md5sums=('SKIP')

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
        -DCATKIN_BUILD_BINARY_PACKAGE=OFF \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
