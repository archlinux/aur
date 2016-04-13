# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - MAVLink message marshaling library."
url='http://qgroundcontrol.org/mavlink/'

pkgname='ros-jade-mavlink'
pkgver='2016.4.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('LGPLv3')

ros_makedepends=()
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2)

ros_depends=(ros-jade-catkin)
depends=(${ros_depends[@]}
  python2)

_tag=release/jade/mavlink/${pkgver}-${_pkgver_patch}
_dir=mavlink
source=("${_dir}"::"git+https://github.com/mavlink/mavlink-gbp-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/jade/setup.bash ] && source /opt/ros/jade/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/jade \
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
