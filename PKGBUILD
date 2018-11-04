# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The gripper_action_controller package."
url='http://www.ros.org/'

pkgname='ros-indigo-gripper-action-controller'
pkgver='0.9.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-controller-interface
  ros-indigo-roscpp
  ros-indigo-control-msgs
  ros-indigo-trajectory-msgs
  ros-indigo-controller-manager
  ros-indigo-hardware-interface
  ros-indigo-control-toolbox
  ros-indigo-realtime-tools
  ros-indigo-angles
  ros-indigo-xacro
  ros-indigo-actionlib
  ros-indigo-cmake-modules
  ros-indigo-catkin
  ros-indigo-urdf)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-controller-interface
  ros-indigo-roscpp
  ros-indigo-control-msgs
  ros-indigo-trajectory-msgs
  ros-indigo-controller-manager
  ros-indigo-hardware-interface
  ros-indigo-control-toolbox
  ros-indigo-realtime-tools
  ros-indigo-angles
  ros-indigo-xacro
  ros-indigo-actionlib
  ros-indigo-cmake-modules
  ros-indigo-urdf)
depends=(${ros_depends[@]})

_tag=release/indigo/gripper_action_controller/${pkgver}-${_pkgver_patch}
_dir=gripper_action_controller
source=(
  "${_dir}"::"git+https://github.com/ros-gbp/ros_controllers-release.git"#tag=${_tag}
  'fix-urdf-lib-compat.patch'
)
sha256sums=('SKIP'
            'e17c3af98a56d448e8077e796734f380ec560575b895b23f78c1944cd69f4cd8')

prepare() {
  cd ${srcdir}/${_dir}
  patch -Np1 -i ${srcdir}/fix-urdf-lib-compat.patch
}

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
