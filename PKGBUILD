# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Metapackage of rqt plugins that are particularly used with robots during its operation."
url='http://ros.org/wiki/rqt_robot_plugins'

pkgname='ros-melodic-rqt-robot-plugins'
pkgver='0.5.7'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-rqt-robot-dashboard
  ros-melodic-rqt-nav-view
  ros-melodic-rqt-tf-tree
  ros-melodic-rqt-rviz
  ros-melodic-rqt-runtime-monitor
  ros-melodic-rqt-robot-steering
  ros-melodic-rqt-moveit
  ros-melodic-rqt-pose-view
  ros-melodic-rqt-robot-monitor)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/rqt_robot_plugins/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rqt_robot_plugins-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rqt_robot_plugins-release-release-melodic-rqt_robot_plugins-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rqt_robot_plugins-release/archive/release/melodic/rqt_robot_plugins/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('2fa30a70d1eed9ff4724c1b9d1ef8303066b373bae9abcbf2b8a715a89e515ba')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DPYTHON_BASENAME=.cpython-37m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
