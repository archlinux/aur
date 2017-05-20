# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - rqt_plot provides a GUI plugin visualizing numeric values in a 2D plot using different plotting backends."
url='http://wiki.ros.org/rqt_plot'

pkgname='ros-lunar-rqt-plot'
pkgver='0.4.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-lunar-qt-gui-py-common
  ros-lunar-rosgraph
  ros-lunar-rqt-py-common
  ros-lunar-std-msgs
  ros-lunar-qwt-dependency
  ros-lunar-python-qt-binding
  ros-lunar-rqt-gui-py
  ros-lunar-rqt-gui
  ros-lunar-rostopic)
depends=(${ros_depends[@]}
  python2-numpy
  python2-rospkg
  python2-matplotlib)

# Git version (e.g. for debugging)
# _tag=release/lunar/rqt_plot/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rqt_plot-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rqt_plot-release-release-lunar-rqt_plot-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rqt_plot-release/archive/release/lunar/rqt_plot/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('ccf117e06d080f1f11bcd66bdfab0f4a7763d92160352d5473509bb0c090016e')

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
