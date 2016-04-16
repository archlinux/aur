# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The Robot Pose EKF package is used to estimate the 3D pose of a robot, based on (partial) pose measurements coming from different sources."
url='http://wiki.ros.org/robot_pose_ekf'

pkgname='ros-indigo-robot-pose-ekf'
pkgver='1.12.7'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-std-msgs
  ros-indigo-rostest
  ros-indigo-catkin
  ros-indigo-sensor-msgs
  ros-indigo-tf
  ros-indigo-nav-msgs
  ros-indigo-bfl)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-std-msgs
  ros-indigo-rostest
  ros-indigo-sensor-msgs
  ros-indigo-tf
  ros-indigo-nav-msgs
  ros-indigo-bfl)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/robot_pose_ekf/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-release-release-indigo-robot_pose_ekf-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/navigation-release/archive/release/indigo/robot_pose_ekf/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('9e79d2ff060bf1dfce16ef595303c62f0ee41b1a7a1088f0cc2269ff959d367c')

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
