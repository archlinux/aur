# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - rqt_common_plugins metapackage provides ROS backend graphical tools suite that can be used on/off of robot runtime."
url='http://ros.org/wiki/rqt_common_plugins'

pkgname='ros-jade-rqt-common-plugins'
pkgver='0.3.13'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-jade-rqt-topic
  ros-jade-rqt-bag-plugins
  ros-jade-rqt-graph
  ros-jade-rqt-msg
  ros-jade-rqt-shell
  ros-jade-rqt-py-console
  ros-jade-rqt-image-view
  ros-jade-rqt-action
  ros-jade-rqt-launch
  ros-jade-rqt-dep
  ros-jade-rqt-srv
  ros-jade-rqt-service-caller
  ros-jade-rqt-console
  ros-jade-rqt-publisher
  ros-jade-rqt-web
  ros-jade-rqt-logger-level
  ros-jade-rqt-reconfigure
  ros-jade-rqt-bag
  ros-jade-rqt-py-common
  ros-jade-rqt-plot
  ros-jade-rqt-top)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/jade/rqt_common_plugins/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rqt_common_plugins-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rqt_common_plugins-release-release-jade-rqt_common_plugins-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rqt_common_plugins-release/archive/release/jade/rqt_common_plugins/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('ff260bb8f50c05d8dabb01a5e837873ae7d86862797ae6e2e685c98803d6888e')

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
