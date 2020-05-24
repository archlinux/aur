# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Wrapper interface for tracing libraries."
url='https://github.com/bosch-robotics-cr/tracetools'

pkgname='ros-noetic-tracetools'
pkgver='0.2.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('APLv2')

ros_makedepends=(ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost
  pkg-config)

ros_depends=()
depends=(${ros_depends[@]})

_dir="ros1_tracetools-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/bosch-robotics-cr/tracetools/archive/${pkgver}.tar.gz")
sha256sums=('3a2aa03551d6de84939260bb4e02b528bec53de81f0bebf44cc4f4610470eaff')

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
