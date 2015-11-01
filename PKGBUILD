# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Some basic robot controllers for use with robot_controllers_interface."
url='http://www.ros.org/'

pkgname='ros-jade-robot-controllers'
pkgver='0.4.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-actionlib-msgs
  ros-jade-urdf
  ros-jade-geometry-msgs
  ros-jade-robot-controllers-interface
  ros-jade-std-msgs
  ros-jade-roscpp
  ros-jade-kdl-parser
  ros-jade-nav-msgs
  ros-jade-orocos-kdl
  ros-jade-catkin
  ros-jade-trajectory-msgs
  ros-jade-actionlib
  ros-jade-sensor-msgs
  ros-jade-tf
  ros-jade-angles
  ros-jade-pluginlib
  ros-jade-tf-conversions
  ros-jade-control-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-jade-actionlib-msgs
  ros-jade-urdf
  ros-jade-geometry-msgs
  ros-jade-robot-controllers-interface
  ros-jade-std-msgs
  ros-jade-roscpp
  ros-jade-kdl-parser
  ros-jade-nav-msgs
  ros-jade-orocos-kdl
  ros-jade-trajectory-msgs
  ros-jade-actionlib
  ros-jade-sensor-msgs
  ros-jade-tf
  ros-jade-pluginlib
  ros-jade-tf-conversions
  ros-jade-control-msgs)
depends=(${ros_depends[@]})

_tag=release/jade/robot_controllers/${pkgver}-${_pkgver_patch}
_dir=robot_controllers
source=("${_dir}"::"git+https://github.com/fetchrobotics-gbp/robot_controllers-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/jade/setup.bash ] && source /opt/ros/jade/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/jade \
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
