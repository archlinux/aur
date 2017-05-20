# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Contains nodelets for processing depth images such as those produced by OpenNI camera."
url='http://ros.org/wiki/depth_image_proc'

pkgname='ros-lunar-depth-image-proc'
pkgver='1.12.20'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-tf2
  ros-lunar-message-filters
  ros-lunar-image-geometry
  ros-lunar-stereo-msgs
  ros-lunar-cmake-modules
  ros-lunar-cv-bridge
  ros-lunar-tf2-ros
  ros-lunar-sensor-msgs
  ros-lunar-nodelet
  ros-lunar-catkin
  ros-lunar-image-transport
  ros-lunar-eigen-conversions)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost)

ros_depends=(ros-lunar-tf2
  ros-lunar-image-geometry
  ros-lunar-cv-bridge
  ros-lunar-tf2-ros
  ros-lunar-nodelet
  ros-lunar-image-transport
  ros-lunar-eigen-conversions)
depends=(${ros_depends[@]}
  boost)

# Git version (e.g. for debugging)
# _tag=release/lunar/depth_image_proc/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/image_pipeline-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="image_pipeline-release-release-lunar-depth_image_proc-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/image_pipeline-release/archive/release/lunar/depth_image_proc/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('ea2a8e946d3dae2dd7a9ef2bd1ef1f9d736790dd58f468317c3c1955cd7e4740')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
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
