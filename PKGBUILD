# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - MAVROS -- MAVLink extendable communication node for ROS with proxy for Ground Control Station."
url='http://wiki.ros.org/mavros'

pkgname='ros-melodic-mavros'
pkgver='0.26.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('GPLv3, LGPLv3, BSD')

ros_makedepends=(ros-melodic-diagnostic-msgs
  ros-melodic-diagnostic-updater
  ros-melodic-mavros-msgs
  ros-melodic-geographic-msgs
  ros-melodic-tf2-eigen
  ros-melodic-eigen-conversions
  ros-melodic-angles
  ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-tf2-ros
  ros-melodic-pluginlib
  ros-melodic-libmavconn
  ros-melodic-std-srvs
  ros-melodic-geometry-msgs
  ros-melodic-rosconsole-bridge
  ros-melodic-mavlink
  ros-melodic-nav-msgs
  ros-melodic-sensor-msgs
  ros-melodic-std-msgs
  ros-melodic-cmake-modules)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  geographiclib
  boost
  eigen3
  geographiclib-tools)

ros_depends=(ros-melodic-diagnostic-msgs
  ros-melodic-diagnostic-updater
  ros-melodic-mavros-msgs
  ros-melodic-geographic-msgs
  ros-melodic-tf2-eigen
  ros-melodic-eigen-conversions
  ros-melodic-std-msgs
  ros-melodic-roscpp
  ros-melodic-tf2-ros
  ros-melodic-pluginlib
  ros-melodic-libmavconn
  ros-melodic-std-srvs
  ros-melodic-geometry-msgs
  ros-melodic-rosconsole-bridge
  ros-melodic-mavlink
  ros-melodic-nav-msgs
  ros-melodic-message-runtime
  ros-melodic-sensor-msgs
  ros-melodic-rospy)
depends=(${ros_depends[@]}
  geographiclib
  boost
  eigen3
  geographiclib-tools)

# Git version (e.g. for debugging)
# _tag=release/melodic/mavros/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/mavlink/mavros-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="mavros-release-release-melodic-mavros-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/mavlink/mavros-release/archive/release/melodic/mavros/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('989427ec828c198eaec56da27a162967467d52ee74e8b505dfccb349a67e4220')

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
