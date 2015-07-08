# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A ROS Node to Stream Image Topics Via a MJPEG Server."
url='http://ros.org/wiki/web_video_server'

pkgname='ros-indigo-web-video-server'
pkgver='0.0.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-roslib
  ros-indigo-image-transport
  ros-indigo-catkin
  ros-indigo-roscpp
  ros-indigo-cv-bridge)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  ffmpeg)

ros_depends=(ros-indigo-roslib
  ros-indigo-image-transport
  ros-indigo-roscpp
  ros-indigo-cv-bridge)
depends=(${ros_depends[@]}
  ffmpeg)

_tag=release/indigo/web_video_server/${pkgver}-${_pkgver_patch}
_dir=web_video_server
source=("${_dir}"::"git+https://github.com/RobotWebTools-release/web_video_server-release.git"#tag=${_tag})
md5sums=('SKIP')

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
