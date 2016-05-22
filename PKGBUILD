# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - turtlesim is a tool made for teaching ROS and ROS packages."
url='http://www.ros.org/wiki/turtlesim'

pkgname='ros-jade-turtlesim'
pkgver='0.6.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-roslib
  ros-jade-geometry-msgs
  ros-jade-std-msgs
  ros-jade-message-generation
  ros-jade-roscpp
  ros-jade-catkin
  ros-jade-std-srvs
  ros-jade-roscpp-serialization
  ros-jade-rosconsole
  ros-jade-rostime)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt4)

ros_depends=(ros-jade-roslib
  ros-jade-geometry-msgs
  ros-jade-std-msgs
  ros-jade-message-runtime
  ros-jade-roscpp
  ros-jade-std-srvs
  ros-jade-roscpp-serialization
  ros-jade-rosconsole
  ros-jade-rostime)
depends=(${ros_depends[@]}
  qt4)

# Git version (e.g. for debugging)
# _tag=release/jade/turtlesim/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_tutorials-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_tutorials-release-release-jade-turtlesim-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_tutorials-release/archive/release/jade/turtlesim/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('93357d1a0e2ebd2457b6543ca35dd1f051958f7fca0b35c58949a3d0a90f2e46')

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
