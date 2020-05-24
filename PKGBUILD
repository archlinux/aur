# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - MAVLink message marshaling library."
url='https://qgroundcontrol.org/mavlink/'

pkgname='ros-noetic-mavlink'
pkgver='2019.9.9'
arch=('any')
pkgrel=1
license=('LGPLv3')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python-lxml
  python-future
  python-distribute
  python)

ros_depends=(ros-noetic-catkin)
depends=(${ros_depends[@]}
  python)

# Git version (e.g. for debugging)
# _tag=release/noetic/mavlink/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/mavlink/mavlink-gbp-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="mavlink-gbp-release-upstream-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/mavlink/mavlink-gbp-release/archive/upstream/${pkgver}.tar.gz")
sha256sums=('e7cc2097f7283a45f4c3e3ea91c62e98225d2d56170aa45153b755a3be63c5cb')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
