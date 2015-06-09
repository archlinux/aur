# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Core libraries used by MoveIt!."
url='http://moveit.ros.org'

pkgname='ros-indigo-moveit-core'
pkgver='0.6.15'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-shape-tools
  ros-indigo-geometric-shapes
  ros-indigo-geometry-msgs
  ros-indigo-shape-msgs
  ros-indigo-visualization-msgs
  ros-indigo-std-msgs
  ros-indigo-eigen-stl-containers
  ros-indigo-actionlib-msgs
  ros-indigo-srdfdom
  ros-indigo-sensor-msgs
  ros-indigo-cmake-modules
  ros-indigo-kdl-parser
  ros-indigo-random-numbers
  ros-indigo-moveit-msgs
  ros-indigo-rostime
  ros-indigo-octomap-msgs
  ros-indigo-octomap
  ros-indigo-trajectory-msgs
  ros-indigo-fcl
  ros-indigo-catkin
  ros-indigo-roslib
  ros-indigo-eigen-conversions)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  urdfdom-headers
  assimp
  eigen3
  urdfdom
  boost
  console-bridge
  pkg-config)

ros_depends=(ros-indigo-kdl-parser
  ros-indigo-std-msgs
  ros-indigo-shape-tools
  ros-indigo-random-numbers
  ros-indigo-geometry-msgs
  ros-indigo-shape-msgs
  ros-indigo-moveit-msgs
  ros-indigo-actionlib-msgs
  ros-indigo-fcl
  ros-indigo-eigen-stl-containers
  ros-indigo-rostime
  ros-indigo-trajectory-msgs
  ros-indigo-octomap-msgs
  ros-indigo-srdfdom
  ros-indigo-sensor-msgs
  ros-indigo-octomap
  ros-indigo-eigen-conversions
  ros-indigo-visualization-msgs
  ros-indigo-geometric-shapes)
depends=(${ros_depends[@]}
  urdfdom-headers
  assimp
  eigen3
  urdfdom
  boost
  console-bridge)

_tag=release/indigo/moveit_core/${pkgver}-${_pkgver_patch}
_dir=moveit_core
source=("${_dir}"::"git+https://github.com/ros-gbp/moveit_core-release.git"#tag=${_tag})
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
        -DPYTHON_BASENAME=-lpython2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
