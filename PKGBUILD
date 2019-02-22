# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Topic tools for treating messages as variant types."
url='http://github.com/ethz-asl/ros-topic-variant'

pkgname='ros-kinetic-variant-topic-tools'
pkgver='0.1.5'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('GNU Lesser General Public License (LGPL)')

ros_makedepends=(ros-kinetic-variant-msgs
  ros-kinetic-roscpp
  ros-kinetic-roslib
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-variant-msgs
  ros-kinetic-roscpp
  ros-kinetic-roslib)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/variant_topic_tools/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/anybotics/variant-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="variant-release-release-kinetic-variant_topic_tools-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/anybotics/variant-release/archive/release/kinetic/variant_topic_tools/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('3dbc102ed4a7edea43a0f57bd7610bf8b9b45883caf8d399d51a33b5eb731737')

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
