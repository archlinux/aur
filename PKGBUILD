# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A metapackage to aggregate the packages required to use publish / subscribe, services, launch files, and other core ROS concepts."
url='http://www.ros.org/'

pkgname='ros-indigo-ros-core'
pkgver='1.1.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-genpy
  ros-indigo-message-generation
  ros-indigo-genlisp
  ros-indigo-std-msgs
  ros-indigo-roslisp
  ros-indigo-roscpp-core
  ros-indigo-message-runtime
  ros-indigo-std-srvs
  ros-indigo-ros-comm
  ros-indigo-catkin
  ros-indigo-genmsg
  ros-indigo-rosconsole-bridge
  ros-indigo-gencpp
  ros-indigo-cmake-modules
  ros-indigo-ros
  ros-indigo-rosgraph-msgs
  ros-indigo-common-msgs
  ros-indigo-rospack
  ros-indigo-ros-tutorials
  ros-indigo-rosbag-migration-rule)
depends=(${ros_depends[@]})

_tag=release/indigo/ros_core/${pkgver}-${_pkgver_patch}
_dir=ros_core
source=("${_dir}"::"git+https://github.com/ros-gbp/metapackages-release.git"#tag=${_tag})
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
