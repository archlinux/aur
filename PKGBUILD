# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A set of message filters which take in messages and may output those messages at a later time, based on the conditions that filter needs met."
url='http://ros.org/wiki/message_filters'

pkgname='ros-melodic-message-filters'
pkgver='1.14.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-rosconsole
  ros-melodic-rostest
  ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-rosunit)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost)

ros_depends=(ros-melodic-rosconsole
  ros-melodic-roscpp)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/message_filters/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_comm-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_comm-release-release-melodic-message_filters-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_comm-release/archive/release/melodic/message_filters/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('3a6ce5214cb6b17a3af6268ddac55c5ac812ef09eb97685e6930da32799a8a3e')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DPYTHON_BASENAME=.cpython-37m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
