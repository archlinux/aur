# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Conversion functions between: - Eigen and KDL - Eigen and geometry_msgs."
url='http://ros.org/wiki/eigen_conversions'

pkgname='ros-indigo-eigen-conversions'
pkgver='1.11.3'
_pkgver_patch=1
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-indigo-cmake-modules
  ros-indigo-catkin
  ros-indigo-std-msgs
  ros-indigo-orocos-kdl
  ros-indigo-geometry-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3)

ros_depends=(ros-indigo-std-msgs
  ros-indigo-orocos-kdl
  ros-indigo-geometry-msgs)
depends=(${ros_depends[@]}
  eigen3)

_tag=release/indigo/eigen_conversions/${pkgver}-${_pkgver_patch}
_dir=eigen_conversions
source=("${_dir}"::"git+https://github.com/ros-gbp/geometry-release.git"#tag=${_tag})
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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
