# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The opencv_apps package, most of code is taken from https://github.com/Itseez/opencv/tree/master/samples/cpp."
url='http://www.ros.org/'

pkgname='ros-indigo-opencv-apps'
pkgver='1.11.13'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-message-generation
  ros-indigo-std-msgs
  ros-indigo-cv-bridge
  ros-indigo-std-srvs
  ros-indigo-catkin
  ros-indigo-image-transport
  ros-indigo-dynamic-reconfigure)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-cv-bridge
  ros-indigo-std-msgs
  ros-indigo-message-runtime
  ros-indigo-std-srvs
  ros-indigo-image-transport
  ros-indigo-dynamic-reconfigure)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/opencv_apps/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-perception/opencv_apps-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="opencv_apps-release-release-indigo-opencv_apps-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-perception/opencv_apps-release/archive/release/indigo/opencv_apps/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('1d1a10f8452dcdeba3737da18968c03cfc91505e40a1f246d3b30e4658550c5f')

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
