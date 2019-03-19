# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Python library to assist in publishing markers easily."
url='http://ros.org/wiki/easy_markers'

pkgname='ros-kinetic-easy-markers'
pkgver='0.2.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-tf
  ros-kinetic-interactive-markers
  ros-kinetic-catkin
  ros-kinetic-roslib
  ros-kinetic-geometry-msgs
  ros-kinetic-visualization-msgs
  ros-kinetic-rospy)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-tf
  ros-kinetic-interactive-markers
  ros-kinetic-roslib
  ros-kinetic-geometry-msgs
  ros-kinetic-visualization-msgs
  ros-kinetic-rospy)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/easy_markers/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/wu-robotics/wu_ros_tools.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="wu_ros_tools-release-kinetic-easy_markers-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/wu-robotics/wu_ros_tools/archive/release/kinetic/easy_markers/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('23ff1f37c017bc511dd6643fb9dbab42fc15ac9137f0ce2071b4da67202ebe99')

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

