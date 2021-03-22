# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - franka_msgs provides messages specific to Franka Emika research robots."
url='h'

pkgname='ros-melodic-franka-msgs'
pkgver='0.7.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('Apache 2.0')

ros_makedepends=(
  ros-melodic-message-generation
  ros-melodic-actionlib-msgs
  ros-melodic-std-msgs
  ros-melodic-catkin
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-melodic-message-runtime
  ros-melodic-actionlib-msgs
  ros-melodic-std-msgs
)

depends=(
  ${ros_depends[@]}
)

_dir="franka_ros-release-release-melodic-franka_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/frankaemika/franka_ros-release/archive/release/melodic/franka_msgs/${pkgver}.tar.gz")
sha256sums=('02518bd4ac55e7272a1c5005df9d6ab06de6c6c180db8ec189b483512dc00e42')


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
    -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
