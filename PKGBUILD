# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS -  MoveIt Resources for testing: Franka Emika Panda A project-internal configuration for testing in MoveIt."
url='h'

pkgname='ros-melodic-moveit-resources-panda-moveit-config'
pkgver='0.7.0'
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
  ros-melodic-xacro
  ros-melodic-robot-state-publisher
  ros-melodic-moveit-resources-panda-description
  ros-melodic-joint-state-publisher
  ros-melodic-joint-state-publisher-gui
  ros-melodic-topic-tools
)

depends=(
  ${ros_depends[@]}
)

_dir="moveit_resources-release-release-melodic-moveit_resources_panda_moveit_config"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-gbp/moveit_resources-release/archive/release/melodic/moveit_resources_panda_moveit_config/${pkgver}.tar.gz")
sha256sums=('8ddc0aee83159b05be65c6b0409c95326808a461b7a4fa9e117d06eb68707d94')


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
