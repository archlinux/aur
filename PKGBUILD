# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - rqt_graph provides a GUI plugin for visualizing the ROS computation graph."
url='http://wiki.ros.org/rqt_graph'

pkgname='ros-melodic-rqt-graph'
pkgver='0.4.10'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-rostopic
  ros-melodic-rosgraph
  ros-melodic-rosgraph-msgs
  ros-melodic-roslib
  ros-melodic-qt-dotgraph
  ros-melodic-rosservice
  ros-melodic-rosnode
  ros-melodic-rqt-gui-py
  ros-melodic-rqt-gui
  ros-melodic-python-qt-binding
  ros-melodic-rospy)
depends=(${ros_depends[@]}
  python-rospkg)

# Git version (e.g. for debugging)
# _tag=release/melodic/rqt_graph/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rqt_graph-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rqt_graph-release-release-melodic-rqt_graph-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rqt_graph-release/archive/release/melodic/rqt_graph/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('42392c916b12e8c40f044840f42090981ae5bdf5925bcaccd716416e2aace427')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DPYTHON_BASENAME=.cpython-37m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
