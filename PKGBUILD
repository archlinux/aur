# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - PCL (Point Cloud Library) ROS interface stack."
url='https://wiki.ros.org/perception_pcl'

pkgname='ros-melodic-pcl-ros'
pkgver='1.7.0'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-rosconsole
  ros-melodic-pcl-conversions
  ros-melodic-nodelet-topic-tools
  ros-melodic-dynamic-reconfigure
  ros-melodic-std-msgs
  ros-melodic-tf2-eigen
  ros-melodic-message-filters
  ros-melodic-roscpp
  ros-melodic-tf
  ros-melodic-roslib
  ros-melodic-catkin
  ros-melodic-pluginlib
  ros-melodic-rosbag
  ros-melodic-nodelet
  ros-melodic-pcl-msgs
  ros-melodic-sensor-msgs
  ros-melodic-cmake-modules)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3
  pcl)

ros_depends=(ros-melodic-pcl-conversions
  ros-melodic-dynamic-reconfigure
  ros-melodic-std-msgs
  ros-melodic-tf2-eigen
  ros-melodic-nodelet
  ros-melodic-roscpp
  ros-melodic-pluginlib
  ros-melodic-rosbag
  ros-melodic-nodelet-topic-tools
  ros-melodic-pcl-msgs
  ros-melodic-message-filters
  ros-melodic-sensor-msgs
  ros-melodic-tf)
depends=(${ros_depends[@]}
  eigen3
  pcl)

# Git version (e.g. for debugging)
# _tag=release/melodic/pcl_ros/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/perception_pcl-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="perception_pcl-${pkgver}/pcl_ros"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/perception_pcl/archive/${pkgver}.tar.gz")
sha256sums=('ac821a662e507df7e48cebc0ba02aaa360b8edbd43873fc6f63bc65ec3d12628')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
