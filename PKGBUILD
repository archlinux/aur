# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS -  Contains a node that rotates an image stream in a way that minimizes the angle between a vector in some arbitrary frame and a vector in the camera frame."
url='http://ros.org/wiki/image_rotate'

pkgname='ros-melodic-image-rotate'
pkgver='1.12.23'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-dynamic-reconfigure
  ros-melodic-image-transport
  ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-tf2-ros
  ros-melodic-geometry-msgs
  ros-melodic-nodelet
  ros-melodic-tf2-geometry-msgs
  ros-melodic-cmake-modules
  ros-melodic-tf2
  ros-melodic-cv-bridge)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-dynamic-reconfigure
  ros-melodic-image-transport
  ros-melodic-roscpp
  ros-melodic-tf2-ros
  ros-melodic-cv-bridge
  ros-melodic-nodelet
  ros-melodic-tf2-geometry-msgs
  ros-melodic-tf2)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/image_rotate/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/image_pipeline-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="image_pipeline-release-release-melodic-image_rotate-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/image_pipeline-release/archive/release/melodic/image_rotate/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('300158018b97ce2b2f3cdfac00889d443b74165b3fb49105317148c76657638a')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DPYTHON_BASENAME=.cpython-37m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
