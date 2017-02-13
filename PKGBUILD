# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - gazebo_ros_control."
url='http://ros.org/wiki/gazebo_ros_control'

pkgname='ros-kinetic-gazebo-ros-control'
pkgver='2.5.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-controller-manager
  ros-kinetic-transmission-interface
  ros-kinetic-urdf
  ros-kinetic-pluginlib
  ros-kinetic-std-msgs
  ros-kinetic-roscpp
  ros-kinetic-control-toolbox
  ros-kinetic-catkin
  ros-kinetic-angles
  ros-kinetic-joint-limits-interface
  ros-kinetic-hardware-interface)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  gazebo)

ros_depends=(ros-kinetic-controller-manager
  ros-kinetic-gazebo-ros
  ros-kinetic-transmission-interface
  ros-kinetic-urdf
  ros-kinetic-pluginlib
  ros-kinetic-std-msgs
  ros-kinetic-roscpp
  ros-kinetic-control-toolbox
  ros-kinetic-angles
  ros-kinetic-joint-limits-interface
  ros-kinetic-hardware-interface)
depends=(${ros_depends[@]}
  gazebo)

# Git version (e.g. for debugging)
# _tag=release/kinetic/gazebo_ros_control/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/gazebo_ros_pkgs-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="gazebo_ros_pkgs-release-release-kinetic-gazebo_ros_control-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/gazebo_ros_pkgs-release/archive/release/kinetic/gazebo_ros_control/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('6b24a363059f250a1a3ff35249fe3863975c3d6d36a5a50e944b9d778a322ac1')

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
