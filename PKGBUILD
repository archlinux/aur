# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This is a set of tools for recording from and playing back to ROS topics."
url='http://ros.org/wiki/rosbag'

pkgname='ros-lunar-rosbag'
pkgver='1.13.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-std-srvs
  ros-lunar-xmlrpcpp
  ros-lunar-roscpp
  ros-lunar-topic-tools
  ros-lunar-roscpp-serialization
  ros-lunar-catkin
  ros-lunar-rosconsole
  ros-lunar-cpp-common
  ros-lunar-rosbag-storage)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2-pillow
  boost)

ros_depends=(ros-lunar-std-srvs
  ros-lunar-xmlrpcpp
  ros-lunar-roscpp
  ros-lunar-genmsg
  ros-lunar-topic-tools
  ros-lunar-roslib
  ros-lunar-rospy
  ros-lunar-rosconsole
  ros-lunar-genpy
  ros-lunar-rosbag-storage)
depends=(${ros_depends[@]}
  python2-rospkg
  boost)

# Git version (e.g. for debugging)
# _tag=release/lunar/rosbag/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_comm-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_comm-release-release-lunar-rosbag-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_comm-release/archive/release/lunar/rosbag/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('11ce894de0c025d1e3592ab1940d262e11473705583634533c673a4ef0f4aade')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 "${srcdir}/${_dir}"

  # Build project
  cmake "${srcdir}/${_dir}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/lunar \
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
