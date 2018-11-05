# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - 3D visualization tool for ROS."
url='http://ros.org/wiki/rviz'

pkgname='ros-kinetic-rviz'
pkgver='1.12.16'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD, Creative Commons')

ros_makedepends=(ros-kinetic-map-msgs
  ros-kinetic-sensor-msgs
  ros-kinetic-rosconsole
  ros-kinetic-catkin
  ros-kinetic-visualization-msgs
  ros-kinetic-geometry-msgs
  ros-kinetic-resource-retriever
  ros-kinetic-pluginlib
  ros-kinetic-std-msgs
  ros-kinetic-std-srvs
  ros-kinetic-roslib
  ros-kinetic-nav-msgs
  ros-kinetic-cmake-modules
  ros-kinetic-tf
  ros-kinetic-urdf
  ros-kinetic-interactive-markers
  ros-kinetic-rospy
  ros-kinetic-rosbag
  ros-kinetic-image-transport
  ros-kinetic-message-filters
  ros-kinetic-python-qt-binding
  ros-kinetic-roscpp
  ros-kinetic-laser-geometry)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt5-base
  ogre
  urdfdom-headers
  assimp
  eigen3
  tinyxml
  mesa
  yaml-cpp)

ros_depends=(ros-kinetic-resource-retriever
  ros-kinetic-map-msgs
  ros-kinetic-sensor-msgs
  ros-kinetic-rosconsole
  ros-kinetic-visualization-msgs
  ros-kinetic-geometry-msgs
  ros-kinetic-media-export
  ros-kinetic-pluginlib
  ros-kinetic-std-msgs
  ros-kinetic-std-srvs
  ros-kinetic-roslib
  ros-kinetic-nav-msgs
  ros-kinetic-tf
  ros-kinetic-urdf
  ros-kinetic-interactive-markers
  ros-kinetic-rospy
  ros-kinetic-rosbag
  ros-kinetic-image-transport
  ros-kinetic-message-filters
  ros-kinetic-python-qt-binding
  ros-kinetic-roscpp
  ros-kinetic-laser-geometry)
depends=(${ros_depends[@]}
  qt5-base
  ogre-1.9
  urdfdom-headers
  assimp
  eigen3
  tinyxml
  mesa
  yaml-cpp)

# Git version (e.g. for debugging)
# _tag=release/kinetic/rviz/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rviz-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rviz-release-release-kinetic-rviz-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rviz-release/archive/release/kinetic/rviz/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('a106924bab0389bd8fe7c76567f70eeffe506dcce88d8c36a7f022b77c0cdd7b')

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
  export PKG_CONFIG_PATH=/opt/OGRE-1.9/lib/pkgconfig:$PKG_CONFIG_PATH
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
