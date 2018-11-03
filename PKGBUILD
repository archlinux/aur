# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Any tools relating to mathematical geometry."
url='http://wiki.ros.org/ecl_geometry'

pkgname='ros-indigo-ecl-geometry'
pkgver='0.61.18'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-ecl-license
  ros-indigo-ecl-math
  ros-indigo-ecl-containers
  ros-indigo-ecl-formatters
  ros-indigo-ecl-exceptions
  ros-indigo-ecl-build
  ros-indigo-ecl-mpl
  ros-indigo-ecl-config
  ros-indigo-catkin
  ros-indigo-ecl-linear-algebra
  ros-indigo-ecl-type-traits)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-ecl-license
  ros-indigo-ecl-math
  ros-indigo-ecl-containers
  ros-indigo-ecl-formatters
  ros-indigo-ecl-exceptions
  ros-indigo-ecl-build
  ros-indigo-ecl-mpl
  ros-indigo-ecl-config
  ros-indigo-ecl-linear-algebra
  ros-indigo-ecl-type-traits)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/ecl_geometry/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/yujinrobot-release/ecl_core-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ecl_core-release-release-indigo-ecl_geometry-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/yujinrobot-release/ecl_core-release/archive/release/indigo/ecl_geometry/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('994f34ea25f8be8fe261321a7a6f57ecabee0b0d03f9bfd15955fdbd574fe592')

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
