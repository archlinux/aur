# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A metapackage to aggregate the packages required to use publish / subscribe, services, launch files, and other core ROS concepts."
url='http://www.ros.org/'

pkgname='ros-kinetic-ros-core'
pkgver='1.3.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-genmsg
  ros-kinetic-message-runtime
  ros-kinetic-roscpp-core
  ros-kinetic-cmake-modules
  ros-kinetic-message-generation
  ros-kinetic-ros-comm
  ros-kinetic-genpy
  ros-kinetic-common-msgs
  ros-kinetic-ros
  ros-kinetic-rosbag-migration-rule
  ros-kinetic-gencpp
  ros-kinetic-std-msgs
  ros-kinetic-std-srvs
  ros-kinetic-rosgraph-msgs
  ros-kinetic-rosconsole-bridge
  ros-kinetic-genlisp
  ros-kinetic-rospack
  ros-kinetic-geneus
  ros-kinetic-gennodejs
  ros-kinetic-roslisp
  ros-kinetic-catkin)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/ros_core/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/metapackages-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="metapackages-release-release-kinetic-ros_core-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/metapackages-release/archive/release/kinetic/ros_core/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('061b9e18a23338fefead88bfe00c6874e19b5b3cf87ca001e8325a347baf3506')

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
