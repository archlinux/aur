# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Open source libraries that will enable the Kinect to be used with Windows, Linux, and Mac."
url='http://ros.org/wiki/libfreenect'

pkgname='ros-kinetic-libfreenect'
pkgver='0.5.1'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('Apache 2.0')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  libusbx
  libxi
  libxmu
  freeglut)

ros_depends=(ros-kinetic-catkin)
depends=(${ros_depends[@]}
  libusbx
  libxi
  libxmu
  freeglut)

# Git version (e.g. for debugging)
# _tag=release/kinetic/libfreenect/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-drivers-gbp/libfreenect-ros-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="libfreenect-ros-release-release-kinetic-libfreenect-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-drivers-gbp/libfreenect-ros-release/archive/release/kinetic/libfreenect/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('c1523f04c9e92d69fe6bf05189a87b74f2b1db907aee16c7fe38d87b7e45457a')

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
