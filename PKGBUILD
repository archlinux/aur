# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS -  Contains a node that rotates an image stream in a way that minimizes the angle between a vector in some arbitrary frame and a vector in the camera frame."
url='http://ros.org/wiki/image_rotate'

pkgname='ros-jade-image-rotate'
pkgver='1.12.16'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-cmake-modules
  ros-jade-geometry-msgs
  ros-jade-tf2-geometry-msgs
  ros-jade-nodelet
  ros-jade-roscpp
  ros-jade-catkin
  ros-jade-eigen-conversions
  ros-jade-image-transport
  ros-jade-tf2
  ros-jade-dynamic-reconfigure
  ros-jade-tf2-ros
  ros-jade-cv-bridge)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-jade-cv-bridge
  ros-jade-tf2-geometry-msgs
  ros-jade-nodelet
  ros-jade-roscpp
  ros-jade-image-transport
  ros-jade-tf2
  ros-jade-tf2-ros
  ros-jade-dynamic-reconfigure)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/jade/image_rotate/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/image_pipeline-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="image_pipeline-release-release-jade-image_rotate-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/image_pipeline-release/archive/release/jade/image_rotate/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('dadc6c4c992d49756d13e20ace8220824e1487ceca9f26a6a94b440f7c984bf0')

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
