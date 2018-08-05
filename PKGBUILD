# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package contains the ROS bindings for the tf2 library, for both Python and C++."
url='http://www.ros.org/wiki/tf2_ros'

pkgname='ros-melodic-tf2-ros'
pkgver='0.6.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-rosgraph
  ros-melodic-std-msgs
  ros-melodic-actionlib-msgs
  ros-melodic-roscpp
  ros-melodic-xmlrpcpp
  ros-melodic-tf2-py
  ros-melodic-tf2-msgs
  ros-melodic-actionlib
  ros-melodic-message-filters
  ros-melodic-catkin
  ros-melodic-rospy
  ros-melodic-tf2
  ros-melodic-geometry-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-rosgraph
  ros-melodic-std-msgs
  ros-melodic-actionlib-msgs
  ros-melodic-roscpp
  ros-melodic-xmlrpcpp
  ros-melodic-tf2-py
  ros-melodic-tf2-msgs
  ros-melodic-actionlib
  ros-melodic-message-filters
  ros-melodic-rospy
  ros-melodic-tf2
  ros-melodic-geometry-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/tf2_ros/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/geometry2-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="geometry2-release-release-melodic-tf2_ros-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/geometry2-release/archive/release/melodic/tf2_ros/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('a92f3b3c050dd41cf658a5f1c0630aa834a888f7f696f25241682319c4ab35b9')

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
