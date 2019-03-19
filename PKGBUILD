# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This library loads a 3D map (as Octree-based OctoMap) and distributes it to other nodes in a compact binary format"
url='http://ros.org/wiki/random_numbers'

pkgname='ros-kinetic-octomap-server'
pkgver='0.6.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-catkin
  ros-kinetic-roscpp
  ros-kinetic-visualization-msgs
  ros-kinetic-sensor-msgs
  ros-kinetic-pcl-ros
  ros-kinetic-pcl-conversions
  ros-kinetic-nav-msgs
  ros-kinetic-std-msgs
  ros-kinetic-std-srvs
  ros-kinetic-octomap
  ros-kinetic-octomap-msgs  
  ros-kinetic-octomap-ros
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-nodelet   
)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost)

ros_depends=(ros-kinetic-roscpp
  ros-kinetic-visualization-msgs
  ros-kinetic-sensor-msgs
  ros-kinetic-pcl-ros
  ros-kinetic-pcl-conversions
  ros-kinetic-nav-msgs
  ros-kinetic-std-msgs
  ros-kinetic-std-srvs
  ros-kinetic-octomap
  ros-kinetic-octomap-msgs
  ros-kinetic-octomap-ros
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-nodelet
)
depends=(${ros_depends[@]}
  boost)

# Git version (e.g. for debugging)
# _tag=release/kinetic/octomap_mapping/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/OctoMap/octomap_mapping.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="octomap_mapping-kinetic-devel"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/OctoMap/octomap_mapping/archive/kinetic-devel/octomap_mapping/${pkgver}.tar.gz")

sha256sums=('ef955b380989c72f9dc397a85e4ffb64a92bd65bcfb58dedaeb868f65f6f254a')

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
  cmake ${srcdir}/${_dir}/octomap_server \
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

