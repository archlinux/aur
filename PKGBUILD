# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Small lib to transform sensor_msgs with tf. Most notably,
PointCloud2"
url='https://wiki.ros.org/tf2_sensor_msgs'

pkgname='ros-noetic-tf2-sensor-msgs'
pkgver='0.7.5'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
  ros-noetic-catkin
  ros-noetic-cmake-modules
)

makedepends=(
  'cmake'
  'ros-build-tools'
  'eigen'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-noetic-sensor-msgs
  ros-noetic-tf2
  ros-noetic-tf2-ros
  ros-noetic-rospy
)

depends=(
  ${ros_depends[@]}
  orocos-kdl-python
)

_dir="geometry2-${pkgver}/tf2_sensor_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/geometry2/archive/${pkgver}.tar.gz")
sha256sums=('0b5d461c71d6dc1dbdb99a2ba39e1515194cd451c2e53d53caadb3ecea13367a')

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
