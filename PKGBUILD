# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - These are lightweight text streaming classes that connect to standardised ecl type devices."
url='http://wiki.ros.org/ecl_streams'

pkgname='ros-indigo-ecl-streams'
pkgver='0.61.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-ecl-devices
  ros-indigo-ecl-errors
  ros-indigo-ecl-license
  ros-indigo-ecl-concepts
  ros-indigo-ecl-converters
  ros-indigo-catkin
  ros-indigo-ecl-time
  ros-indigo-ecl-type-traits)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-ecl-devices
  ros-indigo-ecl-errors
  ros-indigo-ecl-license
  ros-indigo-ecl-concepts
  ros-indigo-ecl-converters
  ros-indigo-ecl-time
  ros-indigo-ecl-type-traits)
depends=(${ros_depends[@]})

_tag=release/indigo/ecl_streams/${pkgver}-${_pkgver_patch}
_dir=ecl_streams
source=("${_dir}"::"git+https://github.com/yujinrobot-release/ecl_core-release.git"#tag=${_tag})
md5sums=('SKIP')

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
