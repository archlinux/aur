# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - World canvas framework messages package."
url='http://ros.org/wiki/world_canvas_msgs'

pkgname='ros-indigo-world-canvas-msgs'
pkgver='0.1.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-uuid-msgs
  ros-indigo-geometry-msgs
  ros-indigo-std-msgs
  ros-indigo-std-srvs
  ros-indigo-catkin
  ros-indigo-message-generation)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-std-msgs
  ros-indigo-uuid-msgs
  ros-indigo-std-srvs
  ros-indigo-message-runtime
  ros-indigo-geometry-msgs)
depends=(${ros_depends[@]})

_tag=release/indigo/world_canvas_msgs/${pkgver}-${_pkgver_patch}
_dir=world_canvas_msgs
source=("${_dir}"::"git+https://github.com/corot/world_canvas_msgs-release.git"#tag=${_tag})
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
