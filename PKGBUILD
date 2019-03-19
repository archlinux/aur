# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - sound_play provides a ROS node that translates commands on a ROS topic (robotsound) into sounds."
url='http://ros.org/wiki/sound_play'

pkgname='ros-kinetic-sound-play'
pkgver='0.3.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-actionlib-msgs
  ros-kinetic-roscpp
  ros-kinetic-audio-common-msgs
  ros-kinetic-roslib
  ros-kinetic-catkin
  ros-kinetic-diagnostic-msgs
  ros-kinetic-actionlib
  ros-kinetic-message-generation)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-actionlib-msgs
  ros-kinetic-message-runtime
  ros-kinetic-roscpp
  ros-kinetic-audio-common-msgs
  ros-kinetic-roslib
  ros-kinetic-diagnostic-msgs
  ros-kinetic-rospy)
depends=(${ros_depends[@]}
  festival
  gstreamer
  gst-plugins-ugly
  gst-plugins-good
  python2-gobject
  festival-english
  gst-plugins-base)

# Git version (e.g. for debugging)
# _tag=release/kinetic/sound_play/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/audio_common-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="audio_common-release-release-kinetic-sound_play-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/audio_common-release/archive/release/kinetic/sound_play/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('71b560ce7dced4540d72e6036c2a908d697263107f61db84f76cfc39d1c7247d')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/kinetic/setup.bash ] && source /opt/ros/kinetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/kinetic \
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
