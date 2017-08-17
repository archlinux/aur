# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - roscpp is a C++ implementation of ROS."
url='http://ros.org/wiki/roscpp'

pkgname='ros-lunar-roscpp'
pkgver='1.13.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-xmlrpcpp
  ros-lunar-roscpp-serialization
  ros-lunar-message-generation
  ros-lunar-rostime
  ros-lunar-catkin
  ros-lunar-rosconsole
  ros-lunar-rosgraph-msgs
  ros-lunar-cpp-common
  ros-lunar-std-msgs
  ros-lunar-roscpp-traits
  ros-lunar-roslang)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  pkg-config)

ros_depends=(ros-lunar-xmlrpcpp
  ros-lunar-roscpp-serialization
  ros-lunar-rostime
  ros-lunar-rosconsole
  ros-lunar-rosgraph-msgs
  ros-lunar-cpp-common
  ros-lunar-std-msgs
  ros-lunar-message-runtime
  ros-lunar-roscpp-traits)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/lunar/roscpp/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_comm-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_comm-release-release-lunar-roscpp-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_comm-release/archive/release/lunar/roscpp/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('0bce1f189d543c57997087d99b7042f5d591d3d2168654f49cac498b4fe4b704')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 "${srcdir}/${_dir}"

  # Build project
  cmake "${srcdir}/${_dir}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/lunar \
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
