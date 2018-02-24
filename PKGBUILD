# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - ROS console output library."
url='http://www.ros.org/wiki/rosconsole'

pkgname='ros-melodic-rosconsole'
pkgver='1.13.6'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-cpp-common
  ros-melodic-catkin
  ros-melodic-rosunit
  ros-melodic-rostime)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  apr
  apr-util
  boost
  log4cxx)

ros_depends=(ros-melodic-cpp-common
  ros-melodic-rosbuild
  ros-melodic-rostime)
depends=(${ros_depends[@]}
  apr
  apr-util
  log4cxx)

# Git version (e.g. for debugging)
# _tag=release/melodic/rosconsole/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_comm-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_comm-release-release-melodic-rosconsole-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_comm-release/archive/release/melodic/rosconsole/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('2f454e47a6c9380b372d44f2d1b0e43db59f6c38a466aaa173fd3f3ce5571286')

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
