# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - rqt_common_plugins metapackage provides ROS backend graphical tools suite that can be used on/off of robot runtime."
url='http://ros.org/wiki/rqt_common_plugins'

pkgname='ros-lunar-rqt-common-plugins'
pkgver='0.4.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-lunar-rqt-service-caller
  ros-lunar-rqt-topic
  ros-lunar-rqt-publisher
  ros-lunar-rqt-console
  ros-lunar-rqt-action
  ros-lunar-rqt-reconfigure
  ros-lunar-rqt-shell
  ros-lunar-rqt-py-common
  ros-lunar-rqt-bag
  ros-lunar-rqt-top
  ros-lunar-rqt-plot
  ros-lunar-rqt-py-console
  ros-lunar-rqt-msg
  ros-lunar-rqt-graph
  ros-lunar-rqt-logger-level
  ros-lunar-rqt-bag-plugins
  ros-lunar-rqt-launch
  ros-lunar-rqt-dep
  ros-lunar-rqt-web
  ros-lunar-rqt-srv
  ros-lunar-rqt-image-view)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/lunar/rqt_common_plugins/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rqt_common_plugins-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rqt_common_plugins-release-release-lunar-rqt_common_plugins-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rqt_common_plugins-release/archive/release/lunar/rqt_common_plugins/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('7d8916108b4faa12ebe98a42c97be3a685f11f69d17f5809c88e791cba29c9f1')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
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
