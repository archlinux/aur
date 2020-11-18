# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - SBPL Lattice Planner  provides a path planning algorithm for ROS"

pkgname='ros-melodic-sbpl-lattice-planner'
pkgver='0.3.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
url="https://github.com/ros-planning/navigation_experimental"
license=('BSD')

ros_makedepends=(ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'  'pkg-config' ${ros_makedepends[@]})

ros_depends=(ros-melodic-roscpp 
ros-melodic-costmap-2d 
ros-melodic-nav-core 
ros-melodic-pluginlib 
ros-melodic-geometry-msgs 
ros-melodic-nav-msgs
ros-melodic-message-generation)
depends=(${ros_depends[@]}
  python-rospkg)

# Git version (e.g. for debugging)
_dir=${pkgname}
source=("${_dir}"::"git+https://github.com/ros-planning/navigation_experimental.git")
sha256sums=('SKIP')
options=('!makeflags')  

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
  cmake ${srcdir}/${pkgname}/sbpl_lattice_planner \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make 
}  

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
