# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - RealSense Camera package allowing access to Intel 3D cameras and advanced modules."
url='http://www.ros.org/wiki/RealSense'

pkgname='ros-kinetic-realsense-camera'
pkgver='1.7.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD 3-clause. See license attached')

ros_makedepends=(ros-kinetic-roslint
  ros-kinetic-cv-bridge
  ros-kinetic-nodelet
  ros-kinetic-tf
  ros-kinetic-camera-info-manager
  ros-kinetic-std-msgs
  ros-kinetic-roscpp
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-librealsense
  ros-kinetic-message-generation
  ros-kinetic-sensor-msgs
  ros-kinetic-image-transport
  ros-kinetic-pcl-ros
  ros-kinetic-rostest
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost)

ros_depends=(ros-kinetic-cv-bridge
  ros-kinetic-nodelet
  ros-kinetic-tf
  ros-kinetic-rgbd-launch
  ros-kinetic-camera-info-manager
  ros-kinetic-message-runtime
  ros-kinetic-std-msgs
  ros-kinetic-roscpp
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-librealsense
  ros-kinetic-message-generation
  ros-kinetic-sensor-msgs
  ros-kinetic-image-transport
  ros-kinetic-pcl-ros
  ros-kinetic-rostest)
depends=(${ros_depends[@]}
  boost)

# Git version (e.g. for debugging)
# _tag=release/kinetic/realsense_camera/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/intel-ros/realsense-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="realsense-release-release-kinetic-realsense_camera-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/intel-ros/realsense-release/archive/release/kinetic/realsense_camera/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('3d8f41b0c6e9ac30272881d9f3e2976b24544d1030d0e1d34c46ca4dce906099')

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
