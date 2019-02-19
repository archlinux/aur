# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - USB Video Class driver library."
url='http://www.ros.org/'

pkgname='ros-melodic-libuvc'
pkgver='0.0.6'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=()
makedepends=('cmake'
             'ros-build-tools'
             ${ros_makedepends[@]}
             libusb)

ros_depends=(ros-melodic-catkin)
depends=(${ros_depends[@]}
         libusb)

# Git version (e.g. for debugging)
# _tag=release/melodic/libuvc/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ktossell/libuvc-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="libuvc-release-release-melodic-libuvc-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ktossell/libuvc-release/archive/release/melodic/libuvc/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('06a553e6d043735a10fff606d5f71a20661fc9b6be392b69a06c35b8aca8d3f6')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DPYTHON_BASENAME=.cpython3.7m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
