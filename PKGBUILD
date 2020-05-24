# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Python library to assist in publishing markers easily."
url='https://wiki.ros.org/easy_markers'

pkgname='ros-noetic-easy-markers'
pkgver='0.2.4'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-tf
  ros-noetic-interactive-markers
  ros-noetic-catkin
  ros-noetic-roslib
  ros-noetic-geometry-msgs
  ros-noetic-visualization-msgs
  ros-noetic-rospy)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-tf
  ros-noetic-interactive-markers
  ros-noetic-roslib
  ros-noetic-geometry-msgs
  ros-noetic-visualization-msgs
  ros-noetic-rospy)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/easy_markers/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/wu-robotics/wu_ros_tools.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="wu_ros_tools-${pkgver}/easy_markers"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/DLu/wu_ros_tools/archive/${pkgver}.tar.gz")
sha256sums=('fd0bb39a69302dae5ccfd565277209719a4199644fc8265a2ae7ccedd92c004a')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
