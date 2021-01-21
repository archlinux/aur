# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Asynchronous Web/WebSocket Server in C++."
url='http://ros.org/wiki/async_web_server_cpp'

pkgname='ros-melodic-async-web-server-cpp'
pkgver='0.0.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost
  openssl)

ros_depends=()
depends=(${ros_depends[@]}
  python-websocket-client
  boost
  openssl)

_tag=release/melodic/async_web_server_cpp/${pkgver}-${_pkgver_patch}
_dir=async_web_server_cpp
source=("${_dir}"::"git+https://github.com/wpi-rail-release/async_web_server_cpp-release.git"#tag=${_tag})
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
  cmake ${srcdir}/${_dir} \
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

