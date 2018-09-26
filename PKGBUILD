# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package retrieves data from url-format files such as http://, ftp://, package:// file://, etc., and loads the data into memory."
url='http://ros.org/wiki/resource_retriever'

pkgname='ros-melodic-resource-retriever'
pkgver='1.12.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-rosconsole
  ros-melodic-catkin
  ros-melodic-roslib)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  curl
  boost)

ros_depends=(ros-melodic-rosconsole
  ros-melodic-roslib)
depends=(${ros_depends[@]}
  python-rospkg
  curl
  boost)

# Git version (e.g. for debugging)
# _tag=release/melodic/resource_retriever/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/resource_retriever-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="resource_retriever-release-release-melodic-resource_retriever-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/resource_retriever-release/archive/release/melodic/resource_retriever/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('568a6d1f0bd3a0c6e4c26b6e6524bc14a282df35a6b3ea1720e37591aaf024a1')

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
