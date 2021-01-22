# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - HTTP Streaming of ROS Image Topics in Multiple Formats."
url='http://ros.org/wiki/web_video_server'

pkgname='ros-melodic-web-video-server'
pkgver='0.2.1'
_pkgver_patch=1
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-roscpp
  ros-melodic-cv-bridge
  ros-melodic-catkin
  ros-melodic-async-web-server-cpp
  ros-melodic-image-transport
  ros-melodic-roslib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  ffmpeg)

ros_depends=(ros-melodic-roslib
  ros-melodic-image-transport
  ros-melodic-async-web-server-cpp
  ros-melodic-roscpp
  ros-melodic-cv-bridge)
depends=(${ros_depends[@]}
  ffmpeg)

_tag=release/melodic/web_video_server/${pkgver}-${_pkgver_patch}
_dir=web_video_server
source=("${_dir}"::"git+https://github.com/RobotWebTools-release/web_video_server-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

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
