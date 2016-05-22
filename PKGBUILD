# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The opencv_apps package, most of code is taken from https://github.com/Itseez/opencv/tree/master/samples/cpp."
url='http://www.ros.org/'

pkgname='ros-jade-opencv-apps'
pkgver='1.11.12'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-nodelet
  ros-jade-cv-bridge
  ros-jade-message-generation
  ros-jade-roscpp
  ros-jade-catkin
  ros-jade-image-transport
  ros-jade-std-srvs
  ros-jade-dynamic-reconfigure)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-jade-cv-bridge
  ros-jade-message-runtime
  ros-jade-nodelet
  ros-jade-roscpp
  ros-jade-image-transport
  ros-jade-std-srvs
  ros-jade-dynamic-reconfigure)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/jade/opencv_apps/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/vision_opencv-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="vision_opencv-release-release-jade-opencv_apps-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/vision_opencv-release/archive/release/jade/opencv_apps/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('f4c461ea99e47696f863e663f6867ad62ab4c44ac00442b74704225812dc5375')

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
