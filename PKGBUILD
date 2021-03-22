# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - Generic framework for robot controls."
url='http://www.ros.org/'

pkgname='ros-melodic-robot-controllers-interface'
pkgver='0.6.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
  ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-actionlib
  ros-melodic-robot-controllers-msgs
  ros-melodic-pluginlib
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-melodic-actionlib
  ros-melodic-robot-controllers-msgs
  ros-melodic-roscpp
  ros-melodic-pluginlib
)

depends=(
  ${ros_depends[@]}
)

_dir="robot_controllers-${pkgver}/robot_controllers_interface"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/fetchrobotics/robot_controllers/archive/${pkgver}.tar.gz")
sha256sums=('2af57b1a21ce2e47e4aae212425d7664272536de9360218c8603a1a470806157')


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
		 -DBOOST_ROOT=/opt/boost1.69 \
		 -DBoost_NO_SYSTEM_PATHS=TRUE
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
