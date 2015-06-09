# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - MoveIt GUI tools for benchmarking."
url='http://moveit.ros.org'

pkgname='ros-indigo-moveit-ros-benchmarks-gui'
pkgver='0.6.5'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-interactive-markers
  ros-indigo-roscpp
  ros-indigo-rviz
  ros-indigo-moveit-ros-benchmarks
  ros-indigo-catkin
  ros-indigo-moveit-ros-planning
  ros-indigo-cmake-modules
  ros-indigo-tf
  ros-indigo-eigen-conversions
  ros-indigo-moveit-ros-warehouse
  ros-indigo-moveit-ros-visualization)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  pkg-config)

ros_depends=(ros-indigo-interactive-markers
  ros-indigo-roscpp
  ros-indigo-rviz
  ros-indigo-moveit-ros-benchmarks
  ros-indigo-moveit-ros-planning
  ros-indigo-tf
  ros-indigo-eigen-conversions
  ros-indigo-moveit-ros-warehouse
  ros-indigo-moveit-ros-visualization)
depends=(${ros_depends[@]})

_tag=release/indigo/moveit_ros_benchmarks_gui/${pkgver}-${_pkgver_patch}
_dir=moveit_ros_benchmarks_gui
source=("${_dir}"::"git+https://github.com/ros-gbp/moveit_ros-release.git"#tag=${_tag})
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
        -DPYTHON_BASENAME=-lpython2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
