# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Package which implements capabilities, including code to parse capability interface specs, to parse capability provider specs, and implement the capability server."
url='http://wiki.ros.org/capabilities'

pkgname='ros-indigo-capabilities'
pkgver='0.2.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-std-msgs
  ros-indigo-rostest
  ros-indigo-std-srvs
  ros-indigo-rospy
  ros-indigo-message-generation
  ros-indigo-roslaunch
  ros-indigo-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-nodelet
  ros-indigo-std-msgs
  ros-indigo-message-runtime
  ros-indigo-rospy
  ros-indigo-std-srvs
  ros-indigo-roslaunch
  ros-indigo-bondpy)
depends=(${ros_depends[@]}
  python2-yaml)

_tag=release/indigo/capabilities/${pkgver}-${_pkgver_patch}
_dir=capabilities
source=("${_dir}"::"git+https://github.com/ros-gbp/capabilities-release.git"#tag=${_tag})
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
