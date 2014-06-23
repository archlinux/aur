# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - roscpp is a C++ implementation of ROS."
url='http://ros.org/wiki/roscpp'

pkgname='ros-indigo-roscpp'
pkgver='1.11.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-roslang
  ros-indigo-roscpp-serialization
  ros-indigo-std-msgs
  ros-indigo-rostime
  ros-indigo-catkin
  ros-indigo-message-generation
  ros-indigo-rosconsole
  ros-indigo-cpp-common
  ros-indigo-roscpp-traits
  ros-indigo-rosgraph-msgs
  ros-indigo-xmlrpcpp)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  pkg-config)

ros_depends=(ros-indigo-roscpp-serialization
  ros-indigo-std-msgs
  ros-indigo-message-runtime
  ros-indigo-rostime
  ros-indigo-rosconsole
  ros-indigo-cpp-common
  ros-indigo-roscpp-traits
  ros-indigo-rosgraph-msgs
  ros-indigo-xmlrpcpp)
depends=(${ros_depends[@]})

_tag=release/indigo/roscpp/${pkgver}-${_pkgver_patch}
_dir=roscpp
source=("${_dir}"::"git+https://github.com/ros-gbp/ros_comm-release.git"#tag=${_tag})
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
