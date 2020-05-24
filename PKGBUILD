# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - sound_play provides a ROS node that translates commands on a ROS topic (robotsound) into sounds."
url='https://wiki.ros.org/sound_play'

pkgname='ros-noetic-sound-play'
pkgver='0.3.3'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-actionlib-msgs
  ros-noetic-roscpp
  ros-noetic-audio-common-msgs
  ros-noetic-roslib
  ros-noetic-catkin
  ros-noetic-diagnostic-msgs
  ros-noetic-actionlib
  ros-noetic-message-generation)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-actionlib-msgs
  ros-noetic-message-runtime
  ros-noetic-roscpp
  ros-noetic-audio-common-msgs
  ros-noetic-roslib
  ros-noetic-diagnostic-msgs
  ros-noetic-rospy)
depends=(${ros_depends[@]}
  festival
  gstreamer
  gst-plugins-ugly
  gst-plugins-good
  python2-gobject
  festival-english
  gst-plugins-base)

# Git version (e.g. for debugging)
# _tag=release/noetic/sound_play/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/audio_common-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="audio_common-${pkgver}/sound_play"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/audio_common/archive/${pkgver}.tar.gz")
sha256sums=('9121ce7ea80945a9efb46d89bd33a454877344aa1b4f405f944943a62e1e4bab')

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
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
