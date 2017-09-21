# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Theora_image_transport provides a plugin to image_transport for transparently sending an image stream encoded with the Theora codec."
url='http://www.ros.org/wiki/image_transport_plugins'

pkgname='ros-kinetic-theora-image-transport'
pkgver='1.9.5'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-kinetic-rosbag
  ros-kinetic-cv-bridge
  ros-kinetic-message-generation
  ros-kinetic-std-msgs
  ros-kinetic-pluginlib
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-image-transport
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  libogg
  libtheora)

ros_depends=(ros-kinetic-rosbag
  ros-kinetic-cv-bridge
  ros-kinetic-message-runtime
  ros-kinetic-std-msgs
  ros-kinetic-pluginlib
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-image-transport)
depends=(${ros_depends[@]}
  libogg
  libtheora)

# Git version (e.g. for debugging)
# _tag=release/kinetic/theora_image_transport/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/image_transport_plugins-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="image_transport_plugins-release-release-kinetic-theora_image_transport-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/image_transport_plugins-release/archive/release/kinetic/theora_image_transport/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('88c28d0f55dd9ca60a3dc313b3eccf4ba387728ccd50890ff302119cbb59dac7')

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
