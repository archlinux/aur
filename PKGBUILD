# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Automatic docking for Kobuki: Users owning a docking station for Kobuki can use this tool to let Kobuki find its nest autonomously."
url='http://ros.org/wiki/kobuki_auto_docking'

pkgname='ros-indigo-kobuki-auto-docking'
pkgver='0.6.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-kdl-conversions
  ros-indigo-kobuki-dock-drive
  ros-indigo-rospy
  ros-indigo-nav-msgs
  ros-indigo-ecl-threads
  ros-indigo-kobuki-msgs
  ros-indigo-actionlib
  ros-indigo-actionlib-msgs
  ros-indigo-ecl-geometry
  ros-indigo-std-msgs
  ros-indigo-catkin
  ros-indigo-ecl-linear-algebra
  ros-indigo-message-filters
  ros-indigo-pluginlib)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-yocs-cmd-vel-mux
  ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-kdl-conversions
  ros-indigo-kobuki-dock-drive
  ros-indigo-rospy
  ros-indigo-nav-msgs
  ros-indigo-ecl-threads
  ros-indigo-kobuki-msgs
  ros-indigo-actionlib
  ros-indigo-actionlib-msgs
  ros-indigo-ecl-geometry
  ros-indigo-std-msgs
  ros-indigo-ecl-linear-algebra
  ros-indigo-message-filters
  ros-indigo-pluginlib)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/kobuki_auto_docking/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/yujinrobot-release/kobuki-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="kobuki-release-release-indigo-kobuki_auto_docking-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/yujinrobot-release/kobuki-release/archive/release/indigo/kobuki_auto_docking/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('8d65e653ef6c4ae2b9cc52711f4374490b649b3e30d9d05e434d69924d893d61')

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
