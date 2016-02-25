# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Transmission Interface."
url='https://github.com/ros-controls/ros_control/wiki'

pkgname='ros-indigo-transmission-interface'
pkgver='0.9.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Modified BSD')

ros_makedepends=(ros-indigo-roscpp
  ros-indigo-resource-retriever
  ros-indigo-catkin
  ros-indigo-hardware-interface
  ros-indigo-cmake-modules
  ros-indigo-pluginlib)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  tinyxml)

ros_depends=(ros-indigo-resource-retriever
  ros-indigo-roscpp
  ros-indigo-pluginlib)
depends=(${ros_depends[@]}
  tinyxml)

# Git version (e.g. for debugging)
# _tag=release/indigo/transmission_interface/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_control-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_control-release-release-indigo-transmission_interface-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_control-release/archive/release/indigo/transmission_interface/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('bb03a6f784ffacc69ec179fe47192758018a66cb74f8b7e390f424837ee7fb6b')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
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
