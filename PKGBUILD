# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - OpenCV 3.x."
url='http://opencv.org'

pkgname='ros-lunar-opencv3'
pkgver='3.2.0'
_pkgver_patch=6
arch=('any')
pkgrel=7
license=('BSD')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2-numpy
  ffmpeg
  libtiff
  libjpeg-turbo
  vtk
  zlib
  v4l-utils
  protobuf
  libwebp-dev
  libpng
  python2)

ros_depends=(ros-lunar-catkin)
depends=(${ros_depends[@]}
  python2-numpy
  ffmpeg
  libjpeg-turbo
  vtk
  zlib
  protobuf
  libwebp-dev
  libpng
  python2)

# Git version (e.g. for debugging)
# _tag=release/lunar/opencv3/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/opencv3-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="opencv3-release-release-lunar-opencv3-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/opencv3-release/archive/release/lunar/opencv3/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('9d84a39c982e6e7e011cf12ddb6962117dcd07e0a9ab5a5ddd096c4d5aeded29')

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
