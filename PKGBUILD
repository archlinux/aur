# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - tf is a package that lets the user keep track of multiple coordinate frames over time."
url='http://www.ros.org/wiki/tf'

pkgname='ros-lunar-tf'
pkgver='1.11.9'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-message-filters
  ros-lunar-roscpp
  ros-lunar-rostime
  ros-lunar-catkin
  ros-lunar-rosconsole
  ros-lunar-angles
  ros-lunar-geometry-msgs
  ros-lunar-sensor-msgs
  ros-lunar-std-msgs
  ros-lunar-message-generation
  ros-lunar-tf2-ros)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-lunar-message-filters
  ros-lunar-roscpp
  ros-lunar-rosconsole
  ros-lunar-geometry-msgs
  ros-lunar-sensor-msgs
  ros-lunar-std-msgs
  ros-lunar-message-runtime
  ros-lunar-roswtf
  ros-lunar-tf2-ros)
depends=(${ros_depends[@]}
  graphviz)

# Git version (e.g. for debugging)
# _tag=release/lunar/tf/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/geometry-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="geometry-release-release-lunar-tf-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/geometry-release/archive/release/lunar/tf/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('350e4ddfc5d16246e4d43d047a70495f1c7942ac64d7176c486cbf664712b716')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
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
