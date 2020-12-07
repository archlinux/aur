# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This library loads a 3D map (as Octree-based OctoMap) and distributes it to other nodes in a compact binary format"
url='http://ros.org/wiki/octomap_server'

pkgname='ros-noetic-octomap-server'
pkgver='0.6.5'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
  ros-noetic-catkin
  ros-noetic-roscpp
  ros-noetic-visualization-msgs
  ros-noetic-sensor-msgs
  ros-noetic-pcl-ros
  ros-noetic-pcl-conversions
  ros-noetic-nav-msgs
  ros-noetic-std-msgs
  ros-noetic-std-srvs
  ros-noetic-octomap
  ros-noetic-octomap-msgs
  ros-noetic-octomap-ros
  ros-noetic-dynamic-reconfigure
  ros-noetic-nodelet
)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost)

ros_depends=(
  ros-noetic-roscpp
  ros-noetic-visualization-msgs
  ros-noetic-sensor-msgs
  ros-noetic-pcl-ros
  ros-noetic-pcl-conversions
  ros-noetic-nav-msgs
  ros-noetic-std-msgs
  ros-noetic-std-srvs
  ros-noetic-octomap
  ros-noetic-octomap-msgs
  ros-noetic-octomap-ros
  ros-noetic-dynamic-reconfigure
  ros-noetic-nodelet
)
depends=(${ros_depends[@]}
  boost)

_dir="octomap_mapping-${pkgver}/octomap_server"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OctoMap/octomap_mapping/archive/${pkgver}.tar.gz")

sha256sums=('dda5b56259a80ab115f547df7a117140016587ec1fe45602845976a518b3c881')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
