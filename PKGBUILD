# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - rqt_common_plugins metapackage provides ROS backend graphical tools suite that can be used on/off of robot runtime."
url='http://ros.org/wiki/rqt_common_plugins'

pkgname='ros-kinetic-rqt-common-plugins'
pkgver='0.4.5'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-rqt-py-console
  ros-kinetic-rqt-py-common
  ros-kinetic-rqt-logger-level
  ros-kinetic-rqt-bag-plugins
  ros-kinetic-rqt-publisher
  ros-kinetic-rqt-console
  ros-kinetic-rqt-plot
  ros-kinetic-rqt-launch
  ros-kinetic-rqt-srv
  ros-kinetic-rqt-web
  ros-kinetic-rqt-shell
  ros-kinetic-rqt-topic
  ros-kinetic-rqt-action
  ros-kinetic-rqt-graph
  ros-kinetic-rqt-msg
  ros-kinetic-rqt-service-caller
  ros-kinetic-rqt-bag
  ros-kinetic-rqt-dep
  ros-kinetic-rqt-image-view
  ros-kinetic-rqt-reconfigure
  ros-kinetic-rqt-top)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/rqt_common_plugins/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rqt_common_plugins-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rqt_common_plugins-release-release-kinetic-rqt_common_plugins-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rqt_common_plugins-release/archive/release/kinetic/rqt_common_plugins/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('db25a055abbfcfce74ffdab365c3c1911eef69232ffe7e27710df12aa187792b')

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
