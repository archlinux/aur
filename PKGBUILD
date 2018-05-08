# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The urdf_sim_tutorial package."
url='http://www.ros.org/'

pkgname='ros-kinetic-urdf-sim-tutorial'
pkgver='0.3.0'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-gazebo-ros-control
  ros-kinetic-joint-state-controller
  ros-kinetic-controller-manager
  ros-kinetic-gazebo-ros
  ros-kinetic-rviz
  ros-kinetic-urdf-tutorial
  ros-kinetic-rqt-robot-steering
  ros-kinetic-robot-state-publisher
  ros-kinetic-position-controllers
  ros-kinetic-xacro
  ros-kinetic-diff-drive-controller)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/urdf_sim_tutorial/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/urdf_tutorial-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="urdf_tutorial-release-release-kinetic-urdf_sim_tutorial-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/urdf_tutorial-release/archive/release/kinetic/urdf_sim_tutorial/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('edae179c71dd174dfd50f7a85af4e9bfec70c106e1d9b47d73a063d24891a590')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/kinetic/setup.bash ] && source /opt/ros/kinetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/kinetic \
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
