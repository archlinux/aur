# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A simple viewer for ROS image topics."
url='http://www.ros.org/wiki/image_view'

pkgname='ros-indigo-image-view'
pkgver='1.12.13'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-cv-bridge
  ros-indigo-std-srvs
  ros-indigo-catkin
  ros-indigo-image-transport
  ros-indigo-rosconsole
  ros-indigo-stereo-msgs
  ros-indigo-sensor-msgs
  ros-indigo-camera-calibration-parsers
  ros-indigo-message-filters)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  opencv
  gtk2)

ros_depends=(ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-cv-bridge
  ros-indigo-std-srvs
  ros-indigo-image-transport
  ros-indigo-rosconsole
  ros-indigo-camera-calibration-parsers
  ros-indigo-message-filters)
depends=(${ros_depends[@]}
  opencv
  gtk2)

_tag=release/indigo/image_view/${pkgver}-${_pkgver_patch}
_dir=image_view
source=("${_dir}"::"git+https://github.com/ros-gbp/image_pipeline-release.git"#tag=${_tag})
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
