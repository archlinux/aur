# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A 2D navigation stack that takes in information from odometry, sensor streams, and a goal pose and outputs safe velocity commands that are sent to a mobile base."
url='http://wiki.ros.org/navigation'

pkgname='ros-jade-navigation'
pkgver='1.13.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD,LGPL,LGPL (amcl)')

ros_makedepends=(ros-jade-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-jade-nav-core
  ros-jade-carrot-planner
  ros-jade-fake-localization
  ros-jade-clear-costmap-recovery
  ros-jade-base-local-planner
  ros-jade-amcl
  ros-jade-navfn
  ros-jade-global-planner
  ros-jade-map-server
  ros-jade-voxel-grid
  ros-jade-dwa-local-planner
  ros-jade-robot-pose-ekf
  ros-jade-move-base-msgs
  ros-jade-move-slow-and-clear
  ros-jade-costmap-2d
  ros-jade-rotate-recovery
  ros-jade-move-base)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/jade/navigation/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-release-release-jade-navigation-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/navigation-release/archive/release/jade/navigation/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('38dbba6374c2ffe5d045404846cc1a8b16361d91a761a3a27331a91b06c07c11')

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
