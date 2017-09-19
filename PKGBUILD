# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Object_recognition_msgs contains the ROS message and the actionlib definition used in object_recognition_core."
url='http://www.ros.org/wiki/object_recognition'

pkgname='ros-kinetic-object-recognition-msgs'
pkgver='0.4.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-geometry-msgs
  ros-kinetic-message-generation
  ros-kinetic-actionlib-msgs
  ros-kinetic-std-msgs
  ros-kinetic-sensor-msgs
  ros-kinetic-catkin
  ros-kinetic-shape-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-geometry-msgs
  ros-kinetic-actionlib-msgs
  ros-kinetic-message-runtime
  ros-kinetic-std-msgs
  ros-kinetic-sensor-msgs
  ros-kinetic-shape-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/object_recognition_msgs/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/object_recognition_msgs-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="object_recognition_msgs-release-release-kinetic-object_recognition_msgs-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/object_recognition_msgs-release/archive/release/kinetic/object_recognition_msgs/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('a04086c726f66fbdde92aada134688305fe3a446ade8f8cf2f7d6ca78f07a51a')

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
