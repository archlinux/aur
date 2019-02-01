# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This is a set of tools for recording from and playing back to ROS topics."
url='http://ros.org/wiki/rosbag'

pkgname='ros-kinetic-rosbag'
pkgver='1.12.14'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-roscpp-serialization
  ros-kinetic-topic-tools
  ros-kinetic-roscpp
  ros-kinetic-cpp-common
  ros-kinetic-xmlrpcpp
  ros-kinetic-std-srvs
  ros-kinetic-catkin
  ros-kinetic-rosconsole
  ros-kinetic-rosbag-storage)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2-pillow
  boost)

ros_depends=(ros-kinetic-genmsg
  ros-kinetic-genpy
  ros-kinetic-topic-tools
  ros-kinetic-rospy
  ros-kinetic-roscpp
  ros-kinetic-xmlrpcpp
  ros-kinetic-std-srvs
  ros-kinetic-roslib
  ros-kinetic-rosconsole
  ros-kinetic-rosbag-storage)
depends=(${ros_depends[@]}
  python2-rospkg
  boost)

# Git version (e.g. for debugging)
# _tag=release/kinetic/rosbag/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_comm-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_comm-release-release-kinetic-rosbag-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_comm-release/archive/release/kinetic/rosbag/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('8a29f2e1350a2ecd29a8bb019dba67f4445bf60ec2c0c95436c345988600e354')

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
