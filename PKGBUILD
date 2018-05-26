# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - ROS communications-related packages, including core client libraries (roscpp, rospy) and graph introspection tools (rostopic, rosnode, rosservice, rosparam)."
url='http://www.ros.org/wiki/ros_comm'

pkgname='ros-melodic-ros-comm'
pkgver='1.14.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-ros
  ros-melodic-roslisp
  ros-melodic-rosgraph-msgs
  ros-melodic-rostest
  ros-melodic-rosservice
  ros-melodic-std-srvs
  ros-melodic-rosconsole
  ros-melodic-rosgraph
  ros-melodic-rosnode
  ros-melodic-roscpp
  ros-melodic-rostopic
  ros-melodic-rosparam
  ros-melodic-topic-tools
  ros-melodic-xmlrpcpp
  ros-melodic-roslaunch
  ros-melodic-rosbag
  ros-melodic-roswtf
  ros-melodic-rosmaster
  ros-melodic-rosmsg
  ros-melodic-message-filters
  ros-melodic-rospy
  ros-melodic-rosout)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/ros_comm/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_comm-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_comm-release-release-melodic-ros_comm-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_comm-release/archive/release/melodic/ros_comm/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('bbf794178d4b567d2271f715a8ebde1e7209afcad79dfa2b5300ce8fd5559839')

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
