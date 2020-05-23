# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - The gripper_action_controller package."
url='http://www.ros.org/'

pkgname='ros-melodic-gripper-action-controller'
pkgver='0.17.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
  ros-melodic-xacro
  ros-melodic-angles
  ros-melodic-control-toolbox
  ros-melodic-roscpp
  ros-melodic-urdf
  ros-melodic-catkin
  ros-melodic-hardware-interface
  ros-melodic-controller-interface
  ros-melodic-actionlib
  ros-melodic-cmake-modules
  ros-melodic-controller-manager
  ros-melodic-realtime-tools
  ros-melodic-trajectory-msgs
  ros-melodic-control-msgs
  ros-melodic-pluginlib
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-melodic-xacro
  ros-melodic-angles
  ros-melodic-control-toolbox
  ros-melodic-roscpp
  ros-melodic-urdf
  ros-melodic-hardware-interface
  ros-melodic-controller-interface
  ros-melodic-actionlib
  ros-melodic-cmake-modules
  ros-melodic-controller-manager
  ros-melodic-realtime-tools
  ros-melodic-trajectory-msgs
  ros-melodic-control-msgs
  ros-melodic-pluginlib
)

depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/effort_controllers/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_controllers-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_controllers-release-release-melodic-gripper_action_controller"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_controllers-release/archive/release/melodic/gripper_action_controller/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('90204cf2e2fd550e34f4e086098bd01f0f21bb6a121d74df7fe6139ff327487d')

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

