# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A set of tools and interfaces extending the capabilities of c++ to provide a lightweight, consistent interface with a focus for control programming."
url='http://www.ros.org/wiki/ecl_core'

pkgname='ros-indigo-ecl-core'
pkgver='0.61.18'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-ecl-statistics
  ros-indigo-ecl-ipc
  ros-indigo-ecl-devices
  ros-indigo-ecl-streams
  ros-indigo-ecl-threads
  ros-indigo-ecl-eigen
  ros-indigo-ecl-mpl
  ros-indigo-ecl-concepts
  ros-indigo-ecl-converters
  ros-indigo-ecl-containers
  ros-indigo-ecl-formatters
  ros-indigo-ecl-exceptions
  ros-indigo-ecl-sigslots
  ros-indigo-ecl-time
  ros-indigo-ecl-geometry
  ros-indigo-ecl-core-apps
  ros-indigo-ecl-command-line
  ros-indigo-ecl-math
  ros-indigo-ecl-utilities
  ros-indigo-ecl-linear-algebra
  ros-indigo-ecl-type-traits)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/ecl_core/${pkgver}-${_pkgver_patch}
# _dir=ecl_core
# source=("${_dir}"::"git+https://github.com/yujinrobot-release/ecl_core-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ecl_core-release-release-indigo-ecl_core-${pkgver}-${_pkgver_patch}"
source=("https://github.com/yujinrobot-release/ecl_core-release/archive/release/indigo/ecl_core/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('5b03c1298e9fae9ffa604a10d50098c8a22caf02d2556fc30d1d29b69e25f0a6')

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
