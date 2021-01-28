# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Small lib to transform sensor_msgs with tf. Most notably,
PointCloud2"
url='https://wiki.ros.org/tf2_sensor_msgs'

pkgname='ros-melodic-tf2-sensor-msgs'
pkgver='0.6.6'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
  ros-melodic-catkin
  ros-melodic-cmake-modules
)

makedepends=(
  'cmake'
  'ros-build-tools'
  'eigen'
  ${ros_makedepends[@]}
  boost1.69
)

ros_depends=(
  ros-melodic-sensor-msgs
  ros-melodic-tf2
  ros-melodic-tf2-ros
  ros-melodic-python-orocos-kdl
  ros-melodic-rospy
)

depends=(
  ${ros_depends[@]}
  boost1.69
)

_dir="geometry2-${pkgver}/tf2_sensor_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/geometry2/archive/${pkgver}.tar.gz")
sha256sums=('4955f3ca30d194b0e0842f59b97a72d0e933908c20c56c8c374c152ab02568d1')

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
