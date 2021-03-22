# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - This package contains a GUI tool for setting and publishing joint state values for a given URDF."
url='h'

pkgname='ros-melodic-joint-state-publisher-gui'
pkgver='1.12.15'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
  ros-melodic-catkin
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-melodic-joint-state-publisher
  ros-melodic-rospy
  ros-melodic-python-qt-binding
)

depends=(
  ${ros_depends[@]}
)

_dir="joint_state_publisher-release-release-melodic-joint_state_publisher_gui"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-gbp/joint_state_publisher-release/archive/release/melodic/joint_state_publisher_gui/${pkgver}.tar.gz")
sha256sums=('6a73f48ab5d5d0a07635fb1e14b3f4ee64b06d76c937d09e17e571f20196cb33')


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
