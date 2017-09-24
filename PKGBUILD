# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - rqt_graph provides a GUI plugin for visualizing the ROS computation graph."
url='http://wiki.ros.org/rqt_graph'

pkgname='ros-lunar-rqt-graph'
pkgver='0.4.9'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-lunar-rosgraph
  ros-lunar-roslib
  ros-lunar-rospy
  ros-lunar-rosservice
  ros-lunar-rosgraph-msgs
  ros-lunar-qt-dotgraph
  ros-lunar-python-qt-binding
  ros-lunar-rqt-gui-py
  ros-lunar-rosnode
  ros-lunar-rqt-gui
  ros-lunar-rostopic)
depends=(${ros_depends[@]}
  python2-rospkg
  qt5-svg)

# Git version (e.g. for debugging)
# _tag=release/lunar/rqt_graph/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rqt_graph-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rqt_graph-release-release-lunar-rqt_graph-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rqt_graph-release/archive/release/lunar/rqt_graph/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('7c25ab92d9b82a4fa51fe4526f6a7edb83f4344cda7c8ad620aae62c186cce23')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/lunar \
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
