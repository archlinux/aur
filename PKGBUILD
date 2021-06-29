# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-noetic-arch/ros-build-tools-py3
pkgdesc="ROS - The pybind11 package."
url='http://www.ros.org/'

pkgname='ros-noetic-pybind11-catkin'
pkgver='2.5.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
  ros-noetic-catkin
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
)

depends=(
  ${ros_depends[@]}
  python
  python-numpy
  eigen
)

_dir="pybind11_catkin-release-release-noetic-pybind11_catkin"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/wxmerkt/pybind11_catkin-release/archive/release/noetic/pybind11_catkin/${pkgver}.tar.gz")
sha256sums=('c5a9b7f752989d63b0abd0dd7b2526b6d857997f0917d7a4772a02d3e06ea356')


build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCATKIN_BUILD_BINARY_PACKAGE=ON \
    -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
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
