# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package allows you to publish the state of a robot to tf."
url='http://wiki.ros.org/robot_state_publisher'

pkgname='ros-melodic-robot-state-publisher'
pkgver='1.13.6'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-rosconsole
  ros-melodic-orocos-kdl
  ros-melodic-tf
  ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-kdl-parser
  ros-melodic-tf2-ros
  ros-melodic-rostime
  ros-melodic-tf2-kdl
  ros-melodic-sensor-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3
  urdfdom-headers)

ros_depends=(ros-melodic-rosconsole
  ros-melodic-orocos-kdl
  ros-melodic-tf
  ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-kdl-parser
  ros-melodic-tf2-ros
  ros-melodic-rostime
  ros-melodic-tf2-kdl
  ros-melodic-sensor-msgs)
depends=(${ros_depends[@]}
  eigen3)

# Git version (e.g. for debugging)
# _tag=release/melodic/robot_state_publisher/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/robot_state_publisher-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="robot_state_publisher-release-release-melodic-robot_state_publisher-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/robot_state_publisher-release/archive/release/melodic/robot_state_publisher/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('6c7097ebd829c690bd5b55296eb4b48ae434f2c75c0e20647f78e716aa56dd74')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DPYTHON_BASENAME=.cpython-37m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
