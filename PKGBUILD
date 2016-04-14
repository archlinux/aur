# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - 3D visualization tool for ROS."
url='http://ros.org/wiki/rviz'

pkgname='ros-indigo-rviz'
pkgver='1.11.14'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD, Creative Commons')

ros_makedepends=(ros-indigo-geometry-msgs
  ros-indigo-python-qt-binding
  ros-indigo-rospy
  ros-indigo-nav-msgs
  ros-indigo-visualization-msgs
  ros-indigo-interactive-markers
  ros-indigo-roscpp
  ros-indigo-std-msgs
  ros-indigo-map-msgs
  ros-indigo-rosconsole
  ros-indigo-laser-geometry
  ros-indigo-cmake-modules
  ros-indigo-tf
  ros-indigo-urdf
  ros-indigo-image-geometry
  ros-indigo-rosbag
  ros-indigo-sensor-msgs
  ros-indigo-std-srvs
  ros-indigo-pluginlib
  ros-indigo-resource-retriever
  ros-indigo-catkin
  ros-indigo-image-transport
  ros-indigo-roslib
  ros-indigo-message-filters)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt4
  ogre
  assimp
  eigen3
  tinyxml
  mesa
  yaml-cpp)

ros_depends=(ros-indigo-geometry-msgs
  ros-indigo-python-qt-binding
  ros-indigo-rospy
  ros-indigo-nav-msgs
  ros-indigo-visualization-msgs
  ros-indigo-interactive-markers
  ros-indigo-roscpp
  ros-indigo-std-msgs
  ros-indigo-map-msgs
  ros-indigo-rosconsole
  ros-indigo-laser-geometry
  ros-indigo-media-export
  ros-indigo-tf
  ros-indigo-urdf
  ros-indigo-image-geometry
  ros-indigo-rosbag
  ros-indigo-sensor-msgs
  ros-indigo-std-srvs
  ros-indigo-pluginlib
  ros-indigo-resource-retriever
  ros-indigo-image-transport
  ros-indigo-roslib
  ros-indigo-message-filters)
depends=(${ros_depends[@]}
  qt4
  ogre
  assimp
  eigen3
  tinyxml
  mesa
  yaml-cpp)

# Git version (e.g. for debugging)
# _tag=release/indigo/rviz/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rviz-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rviz-release-release-indigo-rviz-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rviz-release/archive/release/indigo/rviz/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('17f125bd19e7ef1ccfd6674006346bcd626fbbc8c02b16703db03352ff6cc1bd')

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
