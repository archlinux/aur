# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - velocity_controllers."
url='https://github.com/ros-controls/ros_controllers/wiki'

pkgname='ros-melodic-velocity-controllers'
pkgver='0.15.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-control-msgs
  ros-melodic-controller-interface
  ros-melodic-control-toolbox
  ros-melodic-realtime-tools
  ros-melodic-angles
  ros-melodic-catkin
  ros-melodic-forward-command-controller
  ros-melodic-urdf)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-control-msgs
  ros-melodic-controller-interface
  ros-melodic-control-toolbox
  ros-melodic-realtime-tools
  ros-melodic-angles
  ros-melodic-forward-command-controller
  ros-melodic-urdf)
depends=(${ros_depends[@]})

#_tag=melodic_devel
_commit=b480d5f06568b31b8c68a54de8042e1d63d01534
_dir=ros_controllers
source=("${_dir}"::"git+https://github.com/ros-controls/ros_controllers"#commit=${_commit})
md5sums=('SKIP')

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
  cmake ${srcdir}/${_dir}/velocity_controllers \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.8.so \
        -DPYTHON_BASENAME=-python3.8 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
