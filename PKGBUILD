# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - A ros_control controller that reports robot status using the ROS-Industrial RobotStatus message."
url='http://www.ros.org/'

pkgname='ros-melodic-industrial-robot-status-controller'
pkgver='0.1.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('Apache 2.0')

ros_makedepends=(
  ros-melodic-pluginlib
  ros-melodic-industrial-msgs
  ros-melodic-catkin
  ros-melodic-hardware-interface
  ros-melodic-industrial-robot-status-interface
  ros-melodic-realtime-tools
  ros-melodic-controller-interface
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-melodic-pluginlib
  ros-melodic-industrial-msgs
  ros-melodic-hardware-interface
  ros-melodic-realtime-tools
  ros-melodic-controller-interface
)

depends=(
  ${ros_depends[@]}
)

_dir="industrial_robot_status_controller-release-release-melodic-industrial_robot_status_controller"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/gavanderhoorn/industrial_robot_status_controller-release/archive/release/melodic/industrial_robot_status_controller/${pkgver}.tar.gz")
sha256sums=('df5dea65fc2375ad651dfa2b0498f0e06ab173f4a375279c4e1e208edebf3e9e')


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
    -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 \
    -DPYTHON_LIBRARY=/usr/lib/libpython3.8.so \
    -DPYTHON_BASENAME=.cpython-38 \
    -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
