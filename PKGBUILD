# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Drivers for the Asus Xtion and Primesense Devices."
url='https://wiki.ros.org/openni2_camera'

pkgname='ros-melodic-openni2-camera'
pkgver='1.5.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-melodic-nodelet
  ros-melodic-roscpp
  ros-melodic-message-generation
  ros-melodic-camera-info-manager
  ros-melodic-dynamic-reconfigure
  ros-melodic-sensor-msgs
  ros-melodic-image-transport
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  openni2)

ros_depends=(ros-melodic-nodelet
  ros-melodic-roscpp
  ros-melodic-message-runtime
  ros-melodic-camera-info-manager
  ros-melodic-dynamic-reconfigure
  ros-melodic-sensor-msgs
  ros-melodic-image-transport)
depends=(${ros_depends[@]}
  openni2)

# Git version (e.g. for debugging)
# _tag=release/melodic/openni2_camera/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/openni2_camera-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="openni2_camera-${pkgver}/openni2_camera"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/openni2_camera/archive/${pkgver}.tar.gz")
sha256sums=('d70c3808743b541c933e9ef46730a6bd481b64e8c8e410b8be6b03390093a36b')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
		 -DBOOST_ROOT=/opt/boost1.69 \
		 -DBoost_NO_SYSTEM_PATHS=TRUE
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
