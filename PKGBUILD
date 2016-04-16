# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS -  amcl is a probabilistic localization system for a robot moving in 2D."
url='http://wiki.ros.org/amcl'

pkgname='ros-indigo-amcl'
pkgver='1.12.7'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('LGPL')

ros_makedepends=(ros-indigo-tf
  ros-indigo-roscpp
  ros-indigo-rostest
  ros-indigo-std-srvs
  ros-indigo-nav-msgs
  ros-indigo-catkin
  ros-indigo-dynamic-reconfigure
  ros-indigo-message-filters)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-dynamic-reconfigure
  ros-indigo-tf
  ros-indigo-roscpp
  ros-indigo-nav-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/amcl/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-release-release-indigo-amcl-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/navigation-release/archive/release/indigo/amcl/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('ba328dbff19851f4a2988b6959cac0b969c9eef5d44512ed5dd1dd6cdfdbea4f')

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
