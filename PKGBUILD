# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - This package contains visualization tools for Franka Emika."
url='h'

pkgname='ros-melodic-franka-visualization'
pkgver='0.7.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('Apache 2.0')

ros_makedepends=(
  ros-melodic-catkin
  ros-melodic-libfranka
  ros-melodic-sensor-msgs
  ros-melodic-roscpp
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-melodic-franka-description
  ros-melodic-xacro
  ros-melodic-libfranka
  ros-melodic-roscpp
  ros-melodic-sensor-msgs
)

depends=(
  ${ros_depends[@]}
)

_dir="franka_ros-${pkgver}/franka_visualization"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/frankaemika/franka_ros/archive/${pkgver}.tar.gz")
sha256sums=('5250d6d05c8535a6a19f13a3ed454e9c28ea1d111c4cbd048a394cb346390f44')


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
