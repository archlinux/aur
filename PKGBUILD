# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This rqt plugin succeeds former dynamic_reconfigures GUI (reconfigure_gui), and provides the way to view and edit the parameters that are accessible via dynamic_reconfigure."
url='http://wiki.ros.org/rqt_reconfigure'

pkgname='ros-lunar-rqt-reconfigure'
pkgver='0.4.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-lunar-rqt-console
  ros-lunar-rqt-py-common
  ros-lunar-rospy
  ros-lunar-dynamic-reconfigure
  ros-lunar-python-qt-binding
  ros-lunar-rqt-gui-py
  ros-lunar-rqt-gui)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/lunar/rqt_reconfigure/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rqt_reconfigure-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rqt_reconfigure-release-release-lunar-rqt_reconfigure-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rqt_reconfigure-release/archive/release/lunar/rqt_reconfigure/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('bd24427d7da185c22fc4b23b779027e5e798bb3a0c195f2ac38fed89bb2f5eb2')

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
