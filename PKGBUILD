# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The tuw_nav_msgs package."
url='https://github.com/tuw-robotics/tuw_msgs'

pkgname='ros-melodic-tuw-nav-msgs'
pkgver='0.0.13'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=4
license=('BSD')

ros_makedepends=(ros-melodic-nav-msgs
  ros-melodic-tf
  ros-melodic-std-msgs
  ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-geometry-msgs
  ros-melodic-message-generation
  ros-melodic-tuw-geometry-msgs
  ros-melodic-rospy)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-tf
  ros-melodic-std-msgs
  ros-melodic-message-runtime
  ros-melodic-roscpp
  ros-melodic-geometry-msgs
  ros-melodic-nav-msgs
  ros-melodic-tuw-geometry-msgs
  ros-melodic-rospy)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/tuw_nav_msgs/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/tuw-robotics/tuw_msgs-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="tuw_msgs-${pkgver}/tuw_nav_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/tuw-robotics/tuw_msgs/archive/${pkgver}.tar.gz")
sha256sums=('b22f12be8014a8855cd179d228ae5312102da4b3d176979f66f13e258cc418b6')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
