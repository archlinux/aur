# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - rqt_bag provides a GUI plugin for displaying and replaying ROS bag files."
url='http://ros.org/wiki/rqt_bag'

pkgname='ros-jade-rqt-bag-plugins'
pkgver='0.3.13'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-jade-roslib
  ros-jade-geometry-msgs
  ros-jade-std-msgs
  ros-jade-sensor-msgs
  ros-jade-rqt-gui-py
  ros-jade-rqt-gui
  ros-jade-rosbag
  ros-jade-rqt-bag
  ros-jade-rqt-plot
  ros-jade-rospy)
depends=(${ros_depends[@]}
  python2-pillow
  python2-cairo)

# Git version (e.g. for debugging)
# _tag=release/jade/rqt_bag_plugins/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rqt_common_plugins-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rqt_common_plugins-release-release-jade-rqt_bag_plugins-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rqt_common_plugins-release/archive/release/jade/rqt_bag_plugins/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('aaf0aafa0df94c55b723ed865424e82bed23a162e997755382277525188dc3c4')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/jade/setup.bash ] && source /opt/ros/jade/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/jade \
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
