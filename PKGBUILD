# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Provides zeroconf services on avahi for ros systems."
url='http://wiki.ros.org/zeroconf_avahi'

pkgname='ros-kinetic-zeroconf-avahi'
pkgver='0.2.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-roscpp
  ros-kinetic-catkin
  ros-kinetic-rosconsole
  ros-kinetic-zeroconf-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  avahi)

ros_depends=(ros-kinetic-roscpp
  ros-kinetic-rosconsole
  ros-kinetic-zeroconf-msgs)
depends=(${ros_depends[@]}
  avahi)

# Git version (e.g. for debugging)
# _tag=release/kinetic/zeroconf_avahi/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/yujinrobot-release/zeroconf_avahi_suite-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="zeroconf_avahi_suite-release-release-kinetic-zeroconf_avahi-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/yujinrobot-release/zeroconf_avahi_suite-release/archive/release/kinetic/zeroconf_avahi/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('bf23ee2938a77f7ecbee57ea8f76a542ef82154d831aed726f8120b23f4b2a0b')

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
