# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - RTAB-Maps ros-pkg."
url='http://www.ros.org/'

pkgname='ros-kinetic-rtabmap-ros'
pkgver='0.11.13'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-genmsg
  ros-kinetic-class-loader
  ros-kinetic-rtabmap
  ros-kinetic-sensor-msgs
  ros-kinetic-catkin
  ros-kinetic-stereo-msgs
  ros-kinetic-visualization-msgs
  ros-kinetic-cv-bridge
  ros-kinetic-nodelet
  ros-kinetic-geometry-msgs
  ros-kinetic-std-msgs
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-image-geometry
  ros-kinetic-std-srvs
  ros-kinetic-eigen-conversions
  ros-kinetic-nav-msgs
  ros-kinetic-tf
  ros-kinetic-rospy
  ros-kinetic-octomap-ros
  ros-kinetic-costmap-2d
  ros-kinetic-image-transport
  ros-kinetic-tf2-ros
  ros-kinetic-message-filters
  ros-kinetic-move-base-msgs
  ros-kinetic-pcl-ros
  ros-kinetic-roscpp
  ros-kinetic-pcl-conversions
  ros-kinetic-rviz
  ros-kinetic-tf-conversions
  ros-kinetic-laser-geometry)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  pcl)

ros_depends=(ros-kinetic-class-loader
  ros-kinetic-rtabmap
  ros-kinetic-sensor-msgs
  ros-kinetic-stereo-msgs
  ros-kinetic-visualization-msgs
  ros-kinetic-cv-bridge
  ros-kinetic-nodelet
  ros-kinetic-geometry-msgs
  ros-kinetic-std-msgs
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-image-geometry
  ros-kinetic-std-srvs
  ros-kinetic-eigen-conversions
  ros-kinetic-nav-msgs
  ros-kinetic-image-transport-plugins
  ros-kinetic-tf
  ros-kinetic-rospy
  ros-kinetic-octomap-ros
  ros-kinetic-costmap-2d
  ros-kinetic-image-transport
  ros-kinetic-tf2-ros
  ros-kinetic-message-filters
  ros-kinetic-move-base-msgs
  ros-kinetic-pcl-ros
  ros-kinetic-roscpp
  ros-kinetic-pcl-conversions
  ros-kinetic-rviz
  ros-kinetic-tf-conversions
  ros-kinetic-laser-geometry)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/rtabmap_ros/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/introlab/rtabmap_ros-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rtabmap_ros-release-release-kinetic-rtabmap_ros-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/introlab/rtabmap_ros-release/archive/release/kinetic/rtabmap_ros/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('13bb2a1040adfa82cb8a096bf372cf9184a86309f91acc552b066ed9f4d2db4e')

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
