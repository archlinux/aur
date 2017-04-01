# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - rqt_py_common provides common functionality for rqt plugins written in Python."
url='http://ros.org/wiki/rqt_py_common'

pkgname='ros-indigo-rqt-py-common'
pkgver='0.4.7'
_pkgver_patch=0
arch=('any')
pkgrel=0
license=('BSD')

ros_makedepends=(ros-indigo-genmsg
  ros-indigo-std-msgs
  ros-indigo-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-genpy
  ros-indigo-rosbag
  ros-indigo-qt-gui
  ros-indigo-rospy
  ros-indigo-rostopic
  ros-indigo-actionlib
  ros-indigo-roslib)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/rqt_py_common/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rqt_common_plugins-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
 _dir="rqt_common_plugins-release-release-indigo-rqt_py_common-${pkgver}-${_pkgver_patch}"
 source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rqt_common_plugins-release/archive/release/indigo/rqt_py_common/${pkgver}-${_pkgver_patch}.tar.gz")
 sha256sums=('a30c644e316245990f02a596f4a742034340b2214a38c8db5f66802b2afb4bb4')

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
