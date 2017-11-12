# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The actionlib stack provides a standardized interface for interfacing with preemptable tasks."
url='http://www.ros.org/wiki/actionlib'

pkgname='ros-lunar-actionlib'
pkgver='1.11.11'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-catkin
  ros-lunar-message-generation)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-lunar-roscpp
  ros-lunar-roslib
  ros-lunar-rospy
  ros-lunar-std-msgs
  ros-lunar-rostest
  ros-lunar-message-runtime
  ros-lunar-actionlib-msgs
  ros-lunar-rostopic)
depends=(${ros_depends[@]}
  wxpython
  boost)

ros_checkdepends=(ros-lunar-rosnode)
checkdepends=(${ros_checkdepends[@]})

# Git version (e.g. for debugging)
# _tag=release/lunar/actionlib/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/actionlib-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="actionlib-release-release-lunar-actionlib-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/actionlib-release/archive/release/lunar/actionlib/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('482b6a463c143ba1398f6d14ed49517a986175ac148abb98fa71aa255832ea7d')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 "${srcdir}/${_dir}"

  # Build project
  cmake "${srcdir}/${_dir}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/lunar \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DCATKIN_ENABLE_TESTING=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
