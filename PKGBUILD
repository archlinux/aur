# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Messages for robots using FourWheelSteering"
url='https://wiki.ros.org/four_wheel_steering_msgs'

pkgname='ros-noetic-four-wheel-steering-msgs'
pkgver='1.1.1'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-catkin
  ros-noetic-message-generation
  ros-noetic-message-runtime
  ros-noetic-std-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-std-msgs
  ros-noetic-message-runtime)
depends=(${ros_depends[@]})

_dir="four_wheel_steering_msgs-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/four_wheel_steering_msgs/archive/${pkgver}.tar.gz")
sha256sums=('cc1085576b1d659fa494e164bd3113f07fc56cd97f067614f9a8c02b8a8f4f2e')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
