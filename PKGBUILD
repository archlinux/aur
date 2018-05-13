# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A metapackage to aggregate the packages required to use publish / subscribe, services, launch files, and other core ROS concepts."
url='http://www.ros.org/'

pkgname='ros-melodic-ros-core'
pkgver='1.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-ros
  ros-melodic-genmsg
  ros-melodic-rospack
  ros-melodic-ros-comm
  ros-melodic-common-msgs
  ros-melodic-gencpp
  ros-melodic-std-msgs
  ros-melodic-geneus
  ros-melodic-rosgraph-msgs
  ros-melodic-message-runtime
  ros-melodic-catkin
  ros-melodic-rosconsole-bridge
  ros-melodic-roscpp-core
  ros-melodic-gennodejs
  ros-melodic-genlisp
  ros-melodic-std-srvs
  ros-melodic-rosbag-migration-rule
  ros-melodic-roslisp
  ros-melodic-message-generation
  ros-melodic-genpy
  ros-melodic-cmake-modules)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/ros_core/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/metapackages-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="metapackages-release-release-melodic-ros_core-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/metapackages-release/archive/release/melodic/ros_core/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('e61588bc3394e2c9cf2057c50e106ba54e1dbd1756f8c1e0433e3b0d4d54f9c2')

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
