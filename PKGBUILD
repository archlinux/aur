# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - PCL (Point Cloud Library) ROS interface stack."
url='http://ros.org/wiki/perception_pcl'

pkgname='ros-indigo-pcl-ros'
pkgver='1.2.6'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-indigo-tf
  ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-rosbag
  ros-indigo-std-msgs
  ros-indigo-catkin
  ros-indigo-pcl-msgs
  ros-indigo-pcl-conversions
  ros-indigo-sensor-msgs
  ros-indigo-cmake-modules
  ros-indigo-dynamic-reconfigure
  ros-indigo-pluginlib
  ros-indigo-nodelet-topic-tools)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  vtk
  eigen3
  pcl)

ros_depends=(ros-indigo-tf
  ros-indigo-nodelet-topic-tools
  ros-indigo-roscpp
  ros-indigo-rosbag
  ros-indigo-std-msgs
  ros-indigo-pcl-msgs
  ros-indigo-pcl-conversions
  ros-indigo-sensor-msgs
  ros-indigo-dynamic-reconfigure
  ros-indigo-message-filters
  ros-indigo-pluginlib
  ros-indigo-nodelet)
depends=(${ros_depends[@]}
  vtk
  eigen3
  pcl)

_tag=release/indigo/pcl_ros/${pkgver}-${_pkgver_patch}
_dir=pcl_ros
source=("${_dir}"::"git+https://github.com/ros-gbp/perception_pcl-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
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
