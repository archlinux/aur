# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Metapackage of rqt plugins that are particularly used with robots during its operation."
url='http://ros.org/wiki/rqt_robot_plugins'

pkgname='ros-jade-rqt-robot-plugins'
pkgver='0.4.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-jade-rqt-nav-view
  ros-jade-rqt-robot-dashboard
  ros-jade-rqt-runtime-monitor
  ros-jade-rqt-moveit
  ros-jade-rqt-tf-tree
  ros-jade-rqt-rviz
  ros-jade-rqt-robot-monitor
  ros-jade-rqt-robot-steering
  ros-jade-rqt-pose-view)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/jade/rqt_robot_plugins/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rqt_robot_plugins-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rqt_robot_plugins-release-release-jade-rqt_robot_plugins-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rqt_robot_plugins-release/archive/release/jade/rqt_robot_plugins/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('eb866d9353c6ad8c7d6f34c87cd11d2dfd4d16e0403183b77d6c09fc5a1dceb6')

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
