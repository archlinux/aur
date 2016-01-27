# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - OpenCV 3.0."
url='http://opencvg.org'

pkgname='ros-indigo-opencv3'
pkgver='3.1.0'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=()
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt4
  python2-numpy
  ffmpeg
  libtiff
  libjpeg-turbo
  vtk
  zlib
  v4l-utils
  jasper
  python2-support
  libpng
  python2)

ros_depends=(ros-indigo-catkin)
depends=(${ros_depends[@]}
  qt4
  python2-numpy
  ffmpeg
  libjpeg-turbo
  vtk
  zlib
  jasper
  python2-support
  libpng
  python2)

# Git version (e.g. for debugging)
# _tag=release/indigo/opencv3/${pkgver}-${_pkgver_patch}
# _dir=opencv3
# source=("${_dir}"::"git+https://github.com/ros-gbp/opencv3-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="opencv3-release-release-indigo-opencv3-${pkgver}-${_pkgver_patch}"
source=("https://github.com/ros-gbp/opencv3-release/archive/release/indigo/opencv3/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('9a5614e80bb58b659cf697e8c99e265ea30119c99d6af35609b73a1d8c8c6b42')

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
