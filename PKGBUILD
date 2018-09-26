# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The nodelet package is designed to provide a way to run multiple algorithms in the same process with zero copy transport between algorithms."
url='http://ros.org/wiki/nodelet'

pkgname='ros-melodic-nodelet'
pkgver='1.9.16'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-rosconsole
  ros-melodic-std-msgs
  ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-pluginlib
  ros-melodic-message-generation
  ros-melodic-bondcpp
  ros-melodic-cmake-modules)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  util-linux
  boost)

ros_depends=(ros-melodic-rosconsole
  ros-melodic-std-msgs
  ros-melodic-message-runtime
  ros-melodic-roscpp
  ros-melodic-pluginlib
  ros-melodic-bondcpp
  ros-melodic-rospy)
depends=(${ros_depends[@]}
  util-linux
  boost)

# Git version (e.g. for debugging)
# _tag=release/melodic/nodelet/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/nodelet_core-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="nodelet_core-release-release-melodic-nodelet-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/nodelet_core-release/archive/release/melodic/nodelet/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('3a9e9701df570659d70f871eb7e1970dacd3b89c02513c456f8f0ea1a446d15a')

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
