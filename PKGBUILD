# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Bumper/cliff to pointcloud nodelet: Publish bumpers and cliff sensors events as points in a pointcloud, so navistack can use them for poor-man navigation."
url='http://ros.org/wiki/kobuki_bumper2pc'

pkgname='ros-indigo-kobuki-bumper2pc'
pkgver='0.6.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-catkin
  ros-indigo-kobuki-msgs
  ros-indigo-sensor-msgs
  ros-indigo-pluginlib)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-kobuki-msgs
  ros-indigo-pluginlib
  ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-sensor-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/kobuki_bumper2pc/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/yujinrobot-release/kobuki-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="kobuki-release-release-indigo-kobuki_bumper2pc-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/yujinrobot-release/kobuki-release/archive/release/indigo/kobuki_bumper2pc/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('67863948a4a76f00f05fc95f4e289b5f9abf9922c2843a49efcc08fb5df73b58')

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
