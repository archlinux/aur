# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Drivers for Orbbec Astra Devices."
url='http://www.ros.org/'

pkgname='ros-indigo-astra-camera'
pkgver='0.1.5'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-message-generation
  ros-indigo-catkin
  ros-indigo-image-transport
  ros-indigo-camera-info-manager
  ros-indigo-sensor-msgs
  ros-indigo-dynamic-reconfigure)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  libusbx
  systemd)

ros_depends=(ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-message-runtime
  ros-indigo-image-transport
  ros-indigo-camera-info-manager
  ros-indigo-sensor-msgs
  ros-indigo-dynamic-reconfigure)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/astra_camera/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-drivers-gbp/astra_camera-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="astra_camera-release-release-indigo-astra_camera-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-drivers-gbp/astra_camera-release/archive/release/indigo/astra_camera/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('d545c90340547f4795b1415fe1ec99f7868f0d034a50e342094e123a20a10042')

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
