# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Topic tools for treating messages as variant types."
url='http://github.com/ethz-asl/ros-topic-variant'

pkgname='ros-melodic-variant-topic-tools'
pkgver='0.1.6'
_pkgver_patch=1
arch=('any')
pkgrel=1
license=('GNU Lesser General Public License (LGPL)')

ros_makedepends=(ros-melodic-variant-msgs
  ros-melodic-roscpp
  ros-melodic-roslib
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-variant-msgs
  ros-melodic-roscpp
  ros-melodic-roslib)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/variant_topic_tools/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/anybotics/variant-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="variant-release-release-melodic-variant_topic_tools-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/anybotics/variant-release/archive/release/melodic/variant_topic_tools/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('c22ec49ac6b15f1670b487212d1ff3c840c667c8f55f719f68ceddb02f2e317e')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.8.so \
        -DPYTHON_BASENAME=-python3.8 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
