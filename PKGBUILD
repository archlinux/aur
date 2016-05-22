# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Basic diagnostic_aggregator tests are in the."
url='http://ros.org/wiki/test_diagnostic_aggregator'

pkgname='ros-jade-test-diagnostic-aggregator'
pkgver='1.8.9'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-jade-diagnostic-aggregator
  ros-jade-rostest
  ros-jade-roscpp
  ros-jade-catkin
  ros-jade-diagnostic-msgs
  ros-jade-pluginlib
  ros-jade-rospy)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-jade-diagnostic-msgs
  ros-jade-roscpp
  ros-jade-diagnostic-aggregator
  ros-jade-pluginlib
  ros-jade-rospy)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/jade/test_diagnostic_aggregator/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/diagnostics-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="diagnostics-release-release-jade-test_diagnostic_aggregator-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/diagnostics-release/archive/release/jade/test_diagnostic_aggregator/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('708b89baa36a3e9fb0e831c06a582a3a5c5594b445022028f8a8a3b24ea14e5e')

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
