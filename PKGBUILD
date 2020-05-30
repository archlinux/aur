pkgdesc="ROS - Simple Kalman Filter in Python."
url='https://github.com/DLu/wu_ros_tools'

pkgname='ros-noetic-kalman-filter'
pkgver='0.2.4'
arch=('any')
pkgrel=4
license=('BSD')

ros_makedepends=(ros-noetic-catkin
  ros-noetic-rospy)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-rospy)
depends=(${ros_depends[@]})

_dir="wu_ros_tools-${pkgver}/kalman_filter"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/DLu/wu_ros_tools/archive/${pkgver}.tar.gz")
sha256sums=('fd0bb39a69302dae5ccfd565277209719a4199644fc8265a2ae7ccedd92c004a')

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
