# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - RealSense Camera package allowing access to Intel 3D cameras and advanced modules."
url='http://www.ros.org/wiki/RealSense'

pkgname='ros-indigo-realsense-camera'
pkgver='1.6.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD 3-clause. See license attached')

ros_makedepends=(ros-indigo-dynamic-reconfigure
  ros-indigo-pcl-ros
  ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-cv-bridge
  ros-indigo-std-msgs
  ros-indigo-rostest
  ros-indigo-message-generation
  ros-indigo-librealsense
  ros-indigo-catkin
  ros-indigo-image-transport
  ros-indigo-camera-info-manager
  ros-indigo-sensor-msgs
  ros-indigo-tf)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-dynamic-reconfigure
  ros-indigo-pcl-ros
  ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-cv-bridge
  ros-indigo-std-msgs
  ros-indigo-rostest
  ros-indigo-rgbd-launch
  ros-indigo-message-runtime
  ros-indigo-message-generation
  ros-indigo-librealsense
  ros-indigo-image-transport
  ros-indigo-camera-info-manager
  ros-indigo-sensor-msgs
  ros-indigo-tf)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/realsense_camera/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/intel-ros/realsense-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="realsense-release-release-indigo-realsense_camera-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/intel-ros/realsense-release/archive/release/indigo/realsense_camera/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('df4f94813ec3be379843d246d852afd76bfb928a24ec795c183d163bb82b4c43')

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
