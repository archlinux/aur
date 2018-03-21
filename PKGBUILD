# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The pluginlib package provides tools for writing and dynamically loading plugins using the ROS build infrastructure."
url='http://www.ros.org/wiki/pluginlib'

pkgname='ros-kinetic-pluginlib'
pkgver='1.11.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-catkin
  ros-kinetic-roslib
  ros-kinetic-cmake-modules
  ros-kinetic-rosconsole
  ros-kinetic-class-loader)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  tinyxml2
  boost)

ros_depends=(ros-kinetic-roslib
  ros-kinetic-rosconsole
  ros-kinetic-class-loader)
depends=(${ros_depends[@]}
  tinyxml2
  boost)

# Git version (e.g. for debugging)
# _tag=release/kinetic/pluginlib/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/pluginlib-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="pluginlib-release-release-kinetic-pluginlib-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/pluginlib-release/archive/release/kinetic/pluginlib/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('6721d4877042f9f9f665f0415841b232cde3ce94f8af1ecb426ebcb292e327ad')

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
