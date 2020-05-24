# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Messages for robots using FourWheelSteering"
url='https://wiki.ros.org/four_wheel_steering_msgs'

pkgname='ros-noetic-four-wheel-steering-msgs'
pkgver='1.0.0'
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
sha256sums=('391052596ad1e4b9b57ab74ca337f59af896352b84dba719bb96366429456199')

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
