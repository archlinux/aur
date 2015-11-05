# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A ROS Driver for V4L USB Cameras."
url='http://wiki.ros.org/usb_cam'

pkgname='ros-jade-usb-cam'
pkgver='0.3.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-std-msgs
  ros-jade-sensor-msgs
  ros-jade-roscpp
  ros-jade-catkin
  ros-jade-image-transport
  ros-jade-camera-info-manager)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  ffmpeg)

ros_depends=(ros-jade-sensor-msgs
  ros-jade-std-msgs
  ros-jade-roscpp
  ros-jade-camera-info-manager
  ros-jade-image-transport)
depends=(${ros_depends[@]}
  v4l-utils
  ffmpeg)

_tag=release/jade/usb_cam/${pkgver}-${_pkgver_patch}
_dir=usb_cam
source=("${_dir}"::"git+https://github.com/bosch-ros-pkg-release/usb_cam-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/jade/setup.bash ] && source /opt/ros/jade/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/jade \
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
