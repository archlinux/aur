# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package retrieves data from url-format files such as http://, ftp://, package:// file://, etc., and loads the data into memory."
url='http://ros.org/wiki/resource_retriever'

pkgname='ros-lunar-resource-retriever'
pkgver='1.12.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-catkin
  ros-lunar-roslib
  ros-lunar-rosconsole)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  curl)

ros_depends=(ros-lunar-roslib
  ros-lunar-rosconsole)
depends=(${ros_depends[@]}
  python2-rospkg
  curl)

# Git version (e.g. for debugging)
# _tag=release/lunar/resource_retriever/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/resource_retriever-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="resource_retriever-release-release-lunar-resource_retriever-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/resource_retriever-release/archive/release/lunar/resource_retriever/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('5761b994cc975c1d4fa51c6b0110a0b9243d98b1617bc94d45fdd56672a9535d')

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
