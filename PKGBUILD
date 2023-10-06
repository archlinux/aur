pkgdesc="ROS - The pybind11 package."
url='https://github.com/ipab-slmc/pybind11_catkin'

pkgname='ros-noetic-pybind11-catkin'
pkgver='2.10.3'
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
sha256sums=('709c9c07f4049985ae5cc920306abfa58bfd62a8325ba8fd0a28f78e2d42a594')


build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
    -DCATKIN_BUILD_BINARY_PACKAGE=ON \
    -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
