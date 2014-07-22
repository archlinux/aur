# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Provides ROS plugins that offer message and service publishers for interfacing with Gazebo through ROS."
url='http://gazebosim.org/wiki/Tutorials'

pkgname='ros-indigo-gazebo-ros'
pkgver='2.4.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache 2.0')

ros_makedepends=(ros-indigo-rosgraph-msgs
  ros-indigo-roscpp
  ros-indigo-gazebo-msgs
  ros-indigo-std-msgs
  ros-indigo-geometry-msgs
  ros-indigo-std-srvs
  ros-indigo-catkin
  ros-indigo-message-generation
  ros-indigo-dynamic-reconfigure
  ros-indigo-roslib
  ros-indigo-cmake-modules
  ros-indigo-tf)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  gazebo
  tinyxml)

ros_depends=(ros-indigo-tf
  ros-indigo-roscpp
  ros-indigo-gazebo-msgs
  ros-indigo-std-msgs
  ros-indigo-geometry-msgs
  ros-indigo-std-srvs
  ros-indigo-message-generation
  ros-indigo-dynamic-reconfigure
  ros-indigo-roslib
  ros-indigo-rosgraph-msgs)
depends=(${ros_depends[@]}
  gazebo
  tinyxml)

_tag=release/indigo/gazebo_ros/${pkgver}-${_pkgver_patch}
_dir=gazebo_ros
source=("${_dir}"::"git+https://github.com/ros-gbp/gazebo_ros_pkgs-release.git"#tag=${_tag})
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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
