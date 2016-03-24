# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This unary stack contains the dynamic_reconfigure package which provides a means to change node parameters at any time without having to restart the node."
url='http://ros.org/wiki/dynamic_reconfigure'

pkgname='ros-indigo-dynamic-reconfigure'
pkgver='1.5.43'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-roscpp-serialization
  ros-indigo-roscpp
  ros-indigo-std-msgs
  ros-indigo-rostest
  ros-indigo-catkin
  ros-indigo-message-generation)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost)

ros_depends=(ros-indigo-rosservice
  ros-indigo-roscpp
  ros-indigo-std-msgs
  ros-indigo-message-runtime
  ros-indigo-rospy
  ros-indigo-roslib)
depends=(${ros_depends[@]}
  boost)

# Git version (e.g. for debugging)
# _tag=release/indigo/dynamic_reconfigure/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/dynamic_reconfigure-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="dynamic_reconfigure-release-release-indigo-dynamic_reconfigure-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/dynamic_reconfigure-release/archive/release/indigo/dynamic_reconfigure/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('2941e38dc52f2b5378f1418213a85d413adb0cd5cddf3d253f23fc6c235d89d1')

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
  # TODO: report test issue upstream
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DCATKIN_ENABLE_TESTING=OFF \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
