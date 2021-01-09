# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - sound_play provides a ROS node that translates commands on a ROS topic (robotsound) into sounds."
url='https://wiki.ros.org/sound_play'

pkgname='ros-melodic-sound-play'
pkgver='0.3.10'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-actionlib-msgs
  ros-melodic-roscpp
  ros-melodic-audio-common-msgs
  ros-melodic-roslib
  ros-melodic-catkin
  ros-melodic-diagnostic-msgs
  ros-melodic-actionlib
  ros-melodic-message-generation)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-actionlib-msgs
  ros-melodic-message-runtime
  ros-melodic-roscpp
  ros-melodic-audio-common-msgs
  ros-melodic-roslib
  ros-melodic-diagnostic-msgs
  ros-melodic-rospy)
depends=(${ros_depends[@]}
  festival
  gstreamer
  gst-plugins-ugly
  gst-plugins-good
  python2-gobject
  festival-english
  gst-plugins-base)

# Git version (e.g. for debugging)
# _tag=release/melodic/sound_play/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/audio_common-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="audio_common-${pkgver}/sound_play"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/audio_common/archive/${pkgver}.tar.gz")
sha256sums=('18fc68e3d2fa152bdba6c374845e8dbc366c9fcfe88b90b37c9c8dc9803185e7')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
