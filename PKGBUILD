# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - Messages for use with robot_controllers framework."
url='http://www.ros.org/'

pkgname='ros-melodic-robot-controllers-msgs'
pkgver='0.6.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
  ros-melodic-actionlib-msgs
  ros-melodic-catkin
  ros-melodic-std-msgs
  ros-melodic-message-generation
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-melodic-actionlib-msgs
  ros-melodic-message-runtime
  ros-melodic-std-msgs
)

depends=(
  ${ros_depends[@]}
)

_dir="robot_controllers-release-release-melodic-robot_controllers_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/fetchrobotics-gbp/robot_controllers-release/archive/release/melodic/robot_controllers_msgs/${pkgver}.tar.gz")
sha256sums=('5fe69f250c4281e0a06227bf6ea0f381d8849087a05ec8744f08db4bda5e3856')


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
    -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 \
    -DPYTHON_LIBRARY=/usr/lib/libpython3.8.so \
    -DPYTHON_BASENAME=.cpython-38 \
    -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
