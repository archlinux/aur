# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A collection of node(let)s that stream images from USB cameras (UVC) and provide CameraInfo messages to consumers."
url='http://ros.org/wiki/uvc_camera'

pkgname='ros-indigo-uvc-camera'
pkgver='0.2.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('GPLv2')

ros_makedepends=(ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-catkin
  ros-indigo-image-transport
  ros-indigo-camera-info-manager
  ros-indigo-sensor-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  v4l-utils)

ros_depends=(ros-indigo-image-transport
  ros-indigo-camera-info-manager
  ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-sensor-msgs)
depends=(${ros_depends[@]}
  v4l-utils)

# Git version (e.g. for debugging)
# _tag=release/indigo/uvc_camera/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ktossell/camera_umd-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="camera_umd-release-release-indigo-uvc_camera-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ktossell/camera_umd-release/archive/release/indigo/uvc_camera/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('471b06721ee279809ec7b0ede479ef81b6129c917b1c881a774de5915e5b2daa')

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
