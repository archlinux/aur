# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Kobuki simulation for Gazebo."
url='http://ros.org/wiki/kobuki_gazebo'

pkgname='ros-indigo-kobuki-gazebo'
pkgver='0.4.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-yocs-cmd-vel-mux
  ros-indigo-kobuki-random-walker
  ros-indigo-kobuki-description
  ros-indigo-gazebo-ros
  ros-indigo-robot-state-publisher
  ros-indigo-gazebo-plugins
  ros-indigo-kobuki-safety-controller
  ros-indigo-kobuki-gazebo-plugins)
depends=(${ros_depends[@]})

_tag=release/indigo/kobuki_gazebo/${pkgver}-${_pkgver_patch}
_dir=kobuki_gazebo
source=("${_dir}"::"git+https://github.com/yujinrobot-release/kobuki_desktop-release.git"#tag=${_tag})
md5sums=('SKIP')

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
