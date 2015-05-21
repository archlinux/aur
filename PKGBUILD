# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - rqt_common_plugins metapackage provides ROS backend graphical tools suite that can be used on/off of robot runtime."
url='http://ros.org/wiki/rqt_common_plugins'

pkgname='ros-indigo-rqt-common-plugins'
pkgver='0.3.11'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-rqt-top
  ros-indigo-rqt-publisher
  ros-indigo-rqt-dep
  ros-indigo-rqt-shell
  ros-indigo-rqt-launch
  ros-indigo-rqt-py-common
  ros-indigo-rqt-msg
  ros-indigo-rqt-action
  ros-indigo-rqt-bag
  ros-indigo-rqt-console
  ros-indigo-rqt-logger-level
  ros-indigo-rqt-bag-plugins
  ros-indigo-rqt-plot
  ros-indigo-rqt-service-caller
  ros-indigo-rqt-reconfigure
  ros-indigo-rqt-graph
  ros-indigo-rqt-topic
  ros-indigo-rqt-image-view
  ros-indigo-rqt-srv
  ros-indigo-rqt-web
  ros-indigo-rqt-py-console)
depends=(${ros_depends[@]})

_tag=release/indigo/rqt_common_plugins/${pkgver}-${_pkgver_patch}
_dir=rqt_common_plugins
source=("${_dir}"::"git+https://github.com/ros-gbp/rqt_common_plugins-release.git"#tag=${_tag})
md5sums=('SKIP')

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
