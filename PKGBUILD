# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Contains transforms (e.g."
url='http://wiki.ros.org/ecl_mobile_robot'

pkgname='ros-indigo-ecl-mobile-robot'
pkgver='0.61.18'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-ecl-errors
  ros-indigo-ecl-license
  ros-indigo-ecl-math
  ros-indigo-ecl-formatters
  ros-indigo-ecl-build
  ros-indigo-ecl-geometry
  ros-indigo-catkin
  ros-indigo-ecl-linear-algebra)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-ecl-errors
  ros-indigo-ecl-license
  ros-indigo-ecl-math
  ros-indigo-ecl-formatters
  ros-indigo-ecl-build
  ros-indigo-ecl-geometry
  ros-indigo-ecl-linear-algebra)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/ecl_mobile_robot/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/yujinrobot-release/ecl_navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ecl_navigation-release-release-indigo-ecl_mobile_robot"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/yujinrobot-release/ecl_navigation-release/archive/release/indigo/ecl_mobile_robot/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('1f3ffa68e86ff27bfcd47e8c801ceb3c00b8d4e54aa2ce21275760d1003a6984')

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
