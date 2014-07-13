# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The pluginlib package provides tools for writing and dynamically loading plugins using the ROS build infrastructure."
url='http://www.ros.org/wiki/pluginlib'

pkgname='ros-indigo-pluginlib'
pkgver='1.10.0'
_pkgver_patch=3
arch=('any')
pkgrel=4
license=('BSD, Boost Software License')

ros_makedepends=(ros-indigo-roslib
  ros-indigo-cmake-modules
  ros-indigo-rosconsole
  ros-indigo-catkin
  ros-indigo-class-loader)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost
  tinyxml)

ros_depends=(ros-indigo-roslib
  ros-indigo-rosconsole
  ros-indigo-class-loader)
depends=(${ros_depends[@]}
  boost
  tinyxml)

_tag=release/indigo/pluginlib/${pkgver}-${_pkgver_patch}
_dir=pluginlib
source=("${_dir}"::"git+https://github.com/ros-gbp/pluginlib-release.git"#tag=${_tag})
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
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
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
