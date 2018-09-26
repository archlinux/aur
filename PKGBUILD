# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The urdf_sim_tutorial package."
url='http://www.ros.org/'

pkgname='ros-melodic-urdf-sim-tutorial'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-position-controllers
  ros-melodic-controller-manager
  ros-melodic-joint-state-controller
  ros-melodic-diff-drive-controller
  ros-melodic-urdf-tutorial
  ros-melodic-gazebo-ros-control
  ros-melodic-rqt-robot-steering
  ros-melodic-gazebo-ros
  ros-melodic-xacro
  ros-melodic-rviz
  ros-melodic-robot-state-publisher)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/urdf_sim_tutorial/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/urdf_sim_tutorial-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="urdf_sim_tutorial-release-release-melodic-urdf_sim_tutorial-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/urdf_sim_tutorial-release/archive/release/melodic/urdf_sim_tutorial/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('520f94f7fe52250069283fc7bdd40b734e9153bdcc11b76309fe9522972d8f77')

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
