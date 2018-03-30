# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This is a set of tools for recording from and playing back to ROS topics."
url='http://ros.org/wiki/rosbag'

pkgname='ros-melodic-rosbag'
pkgver='1.13.6'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-std-srvs
  ros-melodic-rosbag-storage
  ros-melodic-cpp-common
  ros-melodic-catkin
  ros-melodic-roscpp
  ros-melodic-topic-tools
  ros-melodic-rosconsole
  ros-melodic-roscpp-serialization
  ros-melodic-xmlrpcpp)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2-pillow
  boost)

ros_depends=(ros-melodic-std-srvs
  ros-melodic-rosbag-storage
  ros-melodic-rospy
  ros-melodic-genmsg
  ros-melodic-roslib
  ros-melodic-roscpp
  ros-melodic-topic-tools
  ros-melodic-rosconsole
  ros-melodic-genpy
  ros-melodic-xmlrpcpp)
depends=(${ros_depends[@]}
  boost
  python2-rospkg)

# Git version (e.g. for debugging)
# _tag=release/melodic/rosbag/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_comm-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_comm-release-release-melodic-rosbag-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_comm-release/archive/release/melodic/rosbag/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('407410c005fbd1fcacef65481f2ec48373f05a10f892d86ab5d84c56f3fbc307')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
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
