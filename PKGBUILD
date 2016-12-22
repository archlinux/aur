# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS -  Contains a node that rotates an image stream in a way that minimizes the angle between a vector in some arbitrary frame and a vector in the camera frame."
url='http://ros.org/wiki/image_rotate'

pkgname='ros-kinetic-image-rotate'
pkgver='1.12.19'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-cmake-modules
  ros-kinetic-tf2
  ros-kinetic-cv-bridge
  ros-kinetic-tf2-geometry-msgs
  ros-kinetic-nodelet
  ros-kinetic-geometry-msgs
  ros-kinetic-roscpp
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-image-transport
  ros-kinetic-eigen-conversions
  ros-kinetic-tf2-ros
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-tf2
  ros-kinetic-cv-bridge
  ros-kinetic-tf2-geometry-msgs
  ros-kinetic-nodelet
  ros-kinetic-roscpp
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-image-transport
  ros-kinetic-tf2-ros)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/image_rotate/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/image_pipeline-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="image_pipeline-release-release-kinetic-image_rotate-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/image_pipeline-release/archive/release/kinetic/image_rotate/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('03bf1350fbf355adaba289757a89055111dcb21a56e2beea36e53af8cca81c0b')

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
