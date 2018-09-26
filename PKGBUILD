# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - XmlRpc++ is a C++ implementation of the XML-RPC protocol."
url='http://xmlrpcpp.sourceforge.net'

pkgname='ros-melodic-xmlrpcpp'
pkgver='1.14.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('LGPL-2.1')

ros_makedepends=(ros-melodic-cpp-common
  ros-melodic-catkin
  ros-melodic-rostime)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-cpp-common
  ros-melodic-rostime)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/xmlrpcpp/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_comm-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_comm-release-release-melodic-xmlrpcpp-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_comm-release/archive/release/melodic/xmlrpcpp/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('d141854dd4371212f6606bfff6f7a44eb1a0292bbcf64cf29f4fed0c0741bc76')

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
