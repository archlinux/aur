# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - MAVROS -- MAVLink extendable communication node for ROS with
proxy for Ground Control Station."
url='https://wiki.ros.org/mavros'

pkgname='ros-melodic-mavros'
pkgver='1.5.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('GPLv3, LGPLv3, BSD')

ros_makedepends=(
  ros-melodic-catkin
  ros-melodic-mavlink
  ros-melodic-angles
  ros-melodic-cmake-modules
)

makedepends=(
  cmake
  ros-build-tools
  ${ros_makedepends[@]}
  boost1.69
  eigen
  geographiclib
)

ros_depends=(
  ros-melodic-diagnostic-updater
  ros-melodic-eigen-conversions
  ros-melodic-libmavconn
  ros-melodic-pluginlib
  ros-melodic-rosconsole-bridge
  ros-melodic-roscpp
  ros-melodic-tf2-ros
  ros-melodic-tf2-eigen
  ros-melodic-message-runtime
  ros-melodic-rospy
  ros-melodic-diagnostic-msgs
  ros-melodic-geometry-msgs
  ros-melodic-mavros-msgs
  ros-melodic-nav-msgs
  ros-melodic-geographic-msgs
  ros-melodic-trajectory-msgs
  ros-melodic-std-msgs
  ros-melodic-std-srvs
  ros-melodic-rosunit
)

depends=(
  ${ros_depends[@]}
  gtest
)

_dir="mavros-${pkgver}/mavros"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/mavlink/mavros/archive/${pkgver}.tar.gz")
sha256sums=('c8aebb37dbd89ebd9082e44905003ed6a3cea5d9527c5ec4aabeb7c8e1177421')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
		 -DBOOST_ROOT=/opt/boost1.69
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
