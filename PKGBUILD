# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This is a set of tools for recording from and playing back to ROS topics."
url='http://ros.org/wiki/rosbag'

pkgname='ros-indigo-rosbag'
pkgver='1.11.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-roscpp-serialization
  ros-indigo-roscpp
  ros-indigo-catkin
  ros-indigo-rosconsole
  ros-indigo-rosbag-storage
  ros-indigo-cpp-common
  ros-indigo-topic-tools
  ros-indigo-xmlrpcpp)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2-pillow
  boost)

ros_depends=(ros-indigo-genpy
  ros-indigo-roscpp
  ros-indigo-genmsg
  ros-indigo-rospy
  ros-indigo-rosconsole
  ros-indigo-rosbag-storage
  ros-indigo-roslib
  ros-indigo-topic-tools
  ros-indigo-xmlrpcpp)
depends=(${ros_depends[@]}
  python2-rospkg
  boost)

_tag=release/indigo/rosbag/${pkgver}-${_pkgver_patch}
_dir=rosbag
source=("${_dir}"::"git+https://github.com/ros-gbp/ros_comm-release.git"#tag=${_tag})
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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
