# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Provides ROS plugins that offer message and service publishers for interfacing with Gazebo through ROS."
url='http://gazebosim.org/tutorials?cat=connect_ros'

pkgname='ros-melodic-gazebo-ros'
pkgver='2.8.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache 2.0')

ros_makedepends=(ros-melodic-tf
  ros-melodic-std-msgs
  ros-melodic-gazebo-msgs
  ros-melodic-dynamic-reconfigure
  ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-roslib
  ros-melodic-std-srvs
  ros-melodic-geometry-msgs
  ros-melodic-rosgraph-msgs
  ros-melodic-cmake-modules
  ros-melodic-gazebo-dev)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  tinyxml)

ros_depends=(ros-melodic-tf
  ros-melodic-std-msgs
  ros-melodic-gazebo-msgs
  ros-melodic-dynamic-reconfigure
  ros-melodic-roscpp
  ros-melodic-roslib
  ros-melodic-std-srvs
  ros-melodic-geometry-msgs
  ros-melodic-rosgraph-msgs
  ros-melodic-gazebo-dev)
depends=(${ros_depends[@]}
  tinyxml)

# Git version (e.g. for debugging)
# _tag=release/melodic/gazebo_ros/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/gazebo_ros_pkgs-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="gazebo_ros_pkgs-release-release-melodic-gazebo_ros-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/gazebo_ros_pkgs-release/archive/release/melodic/gazebo_ros/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('3f4ca2c5c3ee6786465adb44acc4f3aa163355214d84dc228e2e9080e6d50c44')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
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
