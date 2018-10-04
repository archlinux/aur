# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - 3D visualization tool for ROS."
url='http://ros.org/wiki/rviz'

pkgname='ros-melodic-rviz'
pkgver='1.13.1'
_pkgver_patch=0
arch=('any')
pkgrel=5
license=('BSD, Creative Commons')

ros_makedepends=(ros-melodic-map-msgs
  ros-melodic-roslib
  ros-melodic-catkin
  ros-melodic-std-srvs
  ros-melodic-rosconsole
  ros-melodic-tf
  ros-melodic-std-msgs
  ros-melodic-laser-geometry
  ros-melodic-pluginlib
  ros-melodic-geometry-msgs
  ros-melodic-visualization-msgs
  ros-melodic-cmake-modules
  ros-melodic-image-transport
  ros-melodic-rosbag
  ros-melodic-urdf
  ros-melodic-nav-msgs
  ros-melodic-sensor-msgs
  ros-melodic-resource-retriever
  ros-melodic-interactive-markers
  ros-melodic-roscpp
  ros-melodic-message-filters
  ros-melodic-python-qt-binding
  ros-melodic-rospy)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt5-base
  tinyxml2
  ogre-1.9
  urdfdom-headers
  assimp
  eigen3
  mesa
  yaml-cpp)

ros_depends=(ros-melodic-map-msgs
  ros-melodic-roslib
  ros-melodic-std-srvs
  ros-melodic-rosconsole
  ros-melodic-tf
  ros-melodic-std-msgs
  ros-melodic-laser-geometry
  ros-melodic-pluginlib
  ros-melodic-geometry-msgs
  ros-melodic-visualization-msgs
  ros-melodic-media-export
  ros-melodic-image-transport
  ros-melodic-rosbag
  ros-melodic-urdf
  ros-melodic-nav-msgs
  ros-melodic-sensor-msgs
  ros-melodic-resource-retriever
  ros-melodic-interactive-markers
  ros-melodic-roscpp
  ros-melodic-message-filters
  ros-melodic-python-qt-binding
  ros-melodic-rospy)
depends=(${ros_depends[@]}
  qt5-base
  tinyxml2
  ogre-1.9
  urdfdom-headers
  assimp
  eigen3
  mesa
  yaml-cpp)

# Git version (e.g. for debugging)
# _tag=release/melodic/rviz/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rviz-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rviz-release-release-melodic-rviz-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rviz-release/archive/release/melodic/rviz/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('2c457a91f490ceb954760c23f8cc8d8edab3089cae59fa3b335191d96802ae0d')

build() {
  export PKG_CONFIG_PATH=/opt/OGRE-1.9/lib/pkgconfig/

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
