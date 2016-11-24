# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - C++ driver library for Kobuki: Pure C++ driver library for Kobuki."
url='http://ros.org/wiki/kobuki_driver'

pkgname='ros-indigo-kobuki-driver'
pkgver='0.6.5'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-ecl-mobile-robot
  ros-indigo-ecl-devices
  ros-indigo-ecl-converters
  ros-indigo-ecl-build
  ros-indigo-ecl-sigslots
  ros-indigo-ecl-time
  ros-indigo-ecl-geometry
  ros-indigo-ecl-command-line
  ros-indigo-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-ecl-mobile-robot
  ros-indigo-ecl-devices
  ros-indigo-ecl-converters
  ros-indigo-ecl-sigslots
  ros-indigo-ecl-time
  ros-indigo-ecl-geometry
  ros-indigo-ecl-command-line)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/kobuki_driver/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/yujinrobot-release/kobuki_core-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="kobuki_core-release-release-indigo-kobuki_driver-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/yujinrobot-release/kobuki_core-release/archive/release/indigo/kobuki_driver/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('914281e6934314edda2c4740814382d9819aa9cff31823368e987501c0310378')

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
