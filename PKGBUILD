# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Contains nodelets for processing depth images such as those produced by OpenNI camera."
url='http://ros.org/wiki/depth_image_proc'

pkgname='ros-jade-depth-image-proc'
pkgver='1.12.16'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-cmake-modules
  ros-jade-cv-bridge
  ros-jade-sensor-msgs
  ros-jade-nodelet
  ros-jade-catkin
  ros-jade-eigen-conversions
  ros-jade-image-transport
  ros-jade-tf2
  ros-jade-message-filters
  ros-jade-image-geometry
  ros-jade-stereo-msgs
  ros-jade-tf2-ros)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost)

ros_depends=(ros-jade-cv-bridge
  ros-jade-nodelet
  ros-jade-eigen-conversions
  ros-jade-image-transport
  ros-jade-tf2
  ros-jade-image-geometry
  ros-jade-tf2-ros)
depends=(${ros_depends[@]}
  boost)

# Git version (e.g. for debugging)
# _tag=release/jade/depth_image_proc/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/image_pipeline-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="image_pipeline-release-release-jade-depth_image_proc-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/image_pipeline-release/archive/release/jade/depth_image_proc/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('3609992022b48e7bf3116daa916bd02c8a2f56c88c006e741e1c257836f9f731')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/jade/setup.bash ] && source /opt/ros/jade/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/jade \
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
