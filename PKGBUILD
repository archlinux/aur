# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This contains CvBridge, which converts between ROS Image messages and OpenCV images."
url='http://www.ros.org/wiki/cv_bridge'

pkgname='ros-indigo-cv-bridge'
pkgver='1.11.12'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-rosconsole
  ros-indigo-catkin
  ros-indigo-sensor-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  opencv
  python2-numpy
  boost
  python2)

ros_depends=(ros-indigo-rosconsole
  ros-indigo-sensor-msgs)
depends=(${ros_depends[@]}
  opencv
  python2-numpy
  boost
  python2)

# Git version (e.g. for debugging)
# _tag=release/indigo/cv_bridge/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/vision_opencv-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="vision_opencv-release-release-indigo-cv_bridge-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/vision_opencv-release/archive/release/indigo/cv_bridge/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('daf4c222b741d1c4360f613525b60469ace274b4a26f3e4baac9ad147ef8a179')

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
