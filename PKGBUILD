# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - C++ implementation of Lie Groups using Eigen."
url='http://www.ros.org/'

pkgname='ros-indigo-sophus'
pkgver='0.9.0'
_pkgver_patch=2
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=()
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3)

ros_depends=(ros-indigo-catkin)
depends=(${ros_depends[@]}
  eigen3)

# Git version (e.g. for debugging)
# _tag=release/indigo/sophus/${pkgver}-${_pkgver_patch}
# _dir=sophus
# source=("${_dir}"::"git+https://github.com/yujinrobot-release/sophus-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="sophus-release-release-indigo-sophus-${pkgver}-${_pkgver_patch}"
source=("https://github.com/yujinrobot-release/sophus-release/archive/release/indigo/sophus/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('e6bf8334d3b08bc85e0bb44028fe6c3121057641d4a8d3a680a19ceda592c5c7')

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
