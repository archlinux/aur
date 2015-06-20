# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - 3D visualization tool for ROS."
url='http://ros.org/wiki/rviz'

pkgname='ros-jade-rviz'
pkgver='1.11.7'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD, Creative Commons')

ros_makedepends=(ros-jade-roslib
  ros-jade-python-qt-binding
  ros-jade-roscpp
  ros-jade-tf
  ros-jade-resource-retriever
  ros-jade-message-filters
  ros-jade-visualization-msgs
  ros-jade-image-geometry
  ros-jade-cmake-modules
  ros-jade-geometry-msgs
  ros-jade-image-transport
  ros-jade-rospy
  ros-jade-map-msgs
  ros-jade-std-msgs
  ros-jade-std-srvs
  ros-jade-rosbag
  ros-jade-pluginlib
  ros-jade-laser-geometry
  ros-jade-interactive-markers
  ros-jade-urdf
  ros-jade-sensor-msgs
  ros-jade-nav-msgs
  ros-jade-catkin
  ros-jade-rosconsole)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt4
  ogre
  assimp
  eigen3
  tinyxml
  mesa
  yaml-cpp)

ros_depends=(ros-jade-roslib
  ros-jade-python-qt-binding
  ros-jade-roscpp
  ros-jade-tf
  ros-jade-resource-retriever
  ros-jade-message-filters
  ros-jade-visualization-msgs
  ros-jade-image-geometry
  ros-jade-geometry-msgs
  ros-jade-image-transport
  ros-jade-interactive-markers
  ros-jade-rospy
  ros-jade-map-msgs
  ros-jade-std-msgs
  ros-jade-std-srvs
  ros-jade-rosbag
  ros-jade-pluginlib
  ros-jade-laser-geometry
  ros-jade-media-export
  ros-jade-urdf
  ros-jade-sensor-msgs
  ros-jade-nav-msgs
  ros-jade-rosconsole)
depends=(${ros_depends[@]}
  qt4
  ogre
  assimp
  eigen3
  tinyxml
  mesa
  yaml-cpp)

_tag=release/jade/rviz/${pkgver}-${_pkgver_patch}
_dir=rviz
source=("${_dir}"::"git+https://github.com/ros-gbp/rviz-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/jade/setup.bash ] && source /opt/ros/jade/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/jade \
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
