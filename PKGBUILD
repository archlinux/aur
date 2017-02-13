# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - PCL (Point Cloud Library) ROS interface stack."
url='http://ros.org/wiki/perception_pcl'

pkgname='ros-kinetic-pcl-ros'
pkgver='1.4.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-genmsg
  ros-kinetic-message-filters
  ros-kinetic-pcl-conversions
  ros-kinetic-roscpp
  ros-kinetic-cmake-modules
  ros-kinetic-rosbag
  ros-kinetic-tf
  ros-kinetic-nodelet
  ros-kinetic-nodelet-topic-tools
  ros-kinetic-tf2-eigen
  ros-kinetic-std-msgs
  ros-kinetic-pluginlib
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-sensor-msgs
  ros-kinetic-pcl-msgs
  ros-kinetic-roslib
  ros-kinetic-rosconsole
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  vtk
  eigen3
  pcl
  proj)

ros_depends=(ros-kinetic-message-filters
  ros-kinetic-roscpp
  ros-kinetic-rosbag
  ros-kinetic-tf
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-sensor-msgs
  ros-kinetic-nodelet-topic-tools
  ros-kinetic-tf2-eigen
  ros-kinetic-std-msgs
  ros-kinetic-pluginlib
  ros-kinetic-pcl-conversions
  ros-kinetic-nodelet
  ros-kinetic-pcl-msgs)
depends=(${ros_depends[@]}
  vtk
  eigen3
  pcl
  proj)

# Git version (e.g. for debugging)
# _tag=release/kinetic/pcl_ros/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/perception_pcl-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="perception_pcl-release-release-kinetic-pcl_ros-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/perception_pcl-release/archive/release/kinetic/pcl_ros/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('50e5b87ccac5c7b2c2afe163f9e9987bcc73209260c7392f6a3c9cddd5aae913')

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
