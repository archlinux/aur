# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - turtlesim is a tool made for teaching ROS and ROS packages."
url='http://www.ros.org/wiki/turtlesim'

pkgname='ros-melodic-turtlesim'
pkgver='0.8.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-rosconsole
  ros-melodic-roscpp-serialization
  ros-melodic-std-msgs
  ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-roslib
  ros-melodic-std-srvs
  ros-melodic-geometry-msgs
  ros-melodic-rostime
  ros-melodic-message-generation)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt5-base)

ros_depends=(ros-melodic-rosconsole
  ros-melodic-roscpp-serialization
  ros-melodic-std-msgs
  ros-melodic-message-runtime
  ros-melodic-roscpp
  ros-melodic-roslib
  ros-melodic-std-srvs
  ros-melodic-geometry-msgs
  ros-melodic-rostime)
depends=(${ros_depends[@]}
  qt5-base)

# Git version (e.g. for debugging)
# _tag=release/melodic/turtlesim/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_tutorials-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_tutorials-release-release-melodic-turtlesim-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_tutorials-release/archive/release/melodic/turtlesim/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('6eb8e404ff4902d90d71a7120100314898517aab888367bfc02f75a7783684c8')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
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
