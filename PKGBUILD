# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Stereo and single image rectification and disparity processing."
url='http://www.ros.org/wiki/stereo_image_proc'

pkgname='ros-kinetic-stereo-image-proc'
pkgver='1.12.22'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-message-filters
  ros-kinetic-cv-bridge
  ros-kinetic-nodelet
  ros-kinetic-image-proc
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-image-geometry
  ros-kinetic-sensor-msgs
  ros-kinetic-image-transport
  ros-kinetic-stereo-msgs
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-message-filters
  ros-kinetic-cv-bridge
  ros-kinetic-nodelet
  ros-kinetic-image-proc
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-image-geometry
  ros-kinetic-sensor-msgs
  ros-kinetic-image-transport
  ros-kinetic-stereo-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/stereo_image_proc/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/image_pipeline-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="image_pipeline-release-release-kinetic-stereo_image_proc-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/image_pipeline-release/archive/release/kinetic/stereo_image_proc/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('88e96ac6cdd3156014df8f5d3f4e60c691c190ef238603983b5d1b718567dd30')

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
