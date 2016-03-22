# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The control toolbox contains modules that are useful across all controllers."
url='http://wiki.ros.org/control_toolbox'

pkgname='ros-jade-control-toolbox'
pkgver='1.13.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD,LGPL,Apache 2.0')

ros_makedepends=(ros-jade-catkin ros-jade-cmake-modules ros-jade-roscpp)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-jade-dynamic-reconfigure
	ros-jade-message-generation
	ros-jade-message-runtime
	ros-jade-realtime-tools
	ros-jade-std-msgs
	)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/jade/gazebo_ros_pkgs/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::" https://github.com/ros-controls/control_toolbox.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="control_toolbox-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-controls/control_toolbox/archive/${pkgver}.tar.gz")
sha256sums=('270f9df4c8f64b629b873ada6dec202c90da24f3060c8e0e337e9e2528c29064')

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
