# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A controller ensuring the safe operation of Kobuki."
url='http://ros.org/wiki/kobuki_safety_controller'

pkgname='ros-indigo-kobuki-safety-controller'
pkgver='0.6.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-std-msgs
  ros-indigo-ecl-threads
  ros-indigo-catkin
  ros-indigo-kobuki-msgs
  ros-indigo-yocs-controllers
  ros-indigo-pluginlib)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-std-msgs
  ros-indigo-ecl-threads
  ros-indigo-kobuki-msgs
  ros-indigo-yocs-controllers
  ros-indigo-pluginlib)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/kobuki_safety_controller/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/yujinrobot-release/kobuki-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="kobuki-release-release-indigo-kobuki_safety_controller-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/yujinrobot-release/kobuki-release/archive/release/indigo/kobuki_safety_controller/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('f1ab17215fe7c58f78a1cca39bd3fb5d9ee07ae5d4e6b300fea80350c73f772a')

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
