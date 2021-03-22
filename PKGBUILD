# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Drivers for the Microsoft Kinect, Asus Xtion, and Primesense Devices."
url='https://www.wiki.ros.org/openni_camera'

pkgname='ros-melodic-openni-camera'
pkgver='1.11.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=4
license=('BSD')

ros_makedepends=(ros-melodic-nodelet
  ros-melodic-roscpp
  ros-melodic-camera-info-manager
  ros-melodic-dynamic-reconfigure
  ros-melodic-sensor-msgs
  ros-melodic-image-transport
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  openni)

ros_depends=(ros-melodic-nodelet
  ros-melodic-roscpp
  ros-melodic-message-runtime
  ros-melodic-camera-info-manager
  ros-melodic-dynamic-reconfigure
  ros-melodic-sensor-msgs
  ros-melodic-image-transport)
depends=(${ros_depends[@]}
  openni)

# Git version (e.g. for debugging)
# _tag=release/melodic/openni_camera/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/openni_camera-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="openni_camera-${pkgver}/openni_camera"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/openni_camera/archive/${pkgver}.tar.gz")
sha256sums=('4dd0109628b5f8ed497ed11b35023ac82a9ecd3658469dc35b1a04f52ba14daf')

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
