# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - 3D visualization tool for ROS."
url='http://ros.org/wiki/rviz'

pkgname='ros-lunar-rviz'
pkgver='1.12.13'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD, Creative Commons')

ros_makedepends=(ros-lunar-laser-geometry
  ros-lunar-visualization-msgs
  ros-lunar-resource-retriever
  ros-lunar-rospy
  ros-lunar-nav-msgs
  ros-lunar-std-srvs
  ros-lunar-catkin
  ros-lunar-roscpp
  ros-lunar-tf
  ros-lunar-rosconsole
  ros-lunar-geometry-msgs
  ros-lunar-map-msgs
  ros-lunar-sensor-msgs
  ros-lunar-pluginlib
  ros-lunar-urdf
  ros-lunar-cmake-modules
  ros-lunar-std-msgs
  ros-lunar-rosbag
  ros-lunar-python-qt-binding
  ros-lunar-image-transport
  ros-lunar-message-filters
  ros-lunar-roslib
  ros-lunar-interactive-markers)
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

ros_depends=(ros-lunar-laser-geometry
  ros-lunar-visualization-msgs
  ros-lunar-resource-retriever
  ros-lunar-rospy
  ros-lunar-nav-msgs
  ros-lunar-std-srvs
  ros-lunar-roscpp
  ros-lunar-tf
  ros-lunar-media-export
  ros-lunar-rosconsole
  ros-lunar-geometry-msgs
  ros-lunar-map-msgs
  ros-lunar-sensor-msgs
  ros-lunar-pluginlib
  ros-lunar-urdf
  ros-lunar-std-msgs
  ros-lunar-rosbag
  ros-lunar-python-qt-binding
  ros-lunar-image-transport
  ros-lunar-message-filters
  ros-lunar-roslib
  ros-lunar-interactive-markers)
depends=(${ros_depends[@]}
  qt5-base
  ogre
  urdfdom-headers
  assimp
  eigen3
  tinyxml
  mesa
  yaml-cpp)

# Git version (e.g. for debugging)
# _tag=release/lunar/rviz/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rviz-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rviz-release-release-lunar-rviz-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rviz-release/archive/release/lunar/rviz/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('ab03649cb621011e23bcf1078b29fba0cacc8f638e96aa312ebfe16901b75dc9')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 "${srcdir}/${_dir}"

  # Build project
  cmake "${srcdir}/${_dir}" \
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
