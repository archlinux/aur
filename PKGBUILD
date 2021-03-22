# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - franka_hw provides hardware interfaces for using Franka Emika research robots with ros_control."
url='h'

pkgname='ros-melodic-franka-hw'
pkgver='0.7.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('Apache 2.0')

ros_makedepends=(
  ros-melodic-actionlib
  ros-melodic-actionlib-msgs
  ros-melodic-combined-robot-hw
  ros-melodic-controller-interface
  ros-melodic-franka-msgs
  ros-melodic-hardware-interface
  ros-melodic-joint-limits-interface
  ros-melodic-libfranka
  ros-melodic-roscpp
  ros-melodic-urdf
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-melodic-actionlib
  ros-melodic-actionlib-msgs
  ros-melodic-combined-robot-hw
  ros-melodic-controller-interface
  ros-melodic-franka-msgs
  ros-melodic-hardware-interface
  ros-melodic-joint-limits-interface
  ros-melodic-libfranka
  ros-melodic-roscpp
  ros-melodic-urdf
)

depends=(
  ${ros_depends[@]}
)

_dir="franka_ros-release-release-melodic-franka_hw"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/frankaemika/franka_ros-release/archive/release/melodic/franka_hw/${pkgver}.tar.gz")
sha256sums=('1dded229fa715d667606e83727b6a1538d800d5c34f9263ac9ab2d05d447699e')


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
    -DCATKIN_ENABLE_TESTING=0 \
    -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
    -DPYTHON_EXECUTABLE=/usr/bin/python3 \
    -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
