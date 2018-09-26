# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - PCL (Point Cloud Library) ROS interface stack."
url='http://ros.org/wiki/perception_pcl'

pkgname='ros-melodic-pcl-ros'
pkgver='1.6.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
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
_dir="perception_pcl-release-release-melodic-pcl_ros-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/perception_pcl-release/archive/release/melodic/pcl_ros/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('deb1b59fcc5f3f9247e9fa90e7f5bde35d22668aa13a9300a4d6d3315552215e')

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
