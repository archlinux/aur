# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - ROS-ified version of C(anonical) Scan Matcher (CSM)"
url='http://openslam.org/gmapping'

pkgname='ros-kinetic-csm'
pkgver='1.0.2'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('CreativeCommons-by-nc-sa-2.0')

ros_makedepends=(ros-kinetic-catkin)
makedepends=('cmake' 'git' 'gsl' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=()
depends=(${ros_depends[@]})

_tag=${pkgver}
# _dir=
source=("git://github.com/AndreaCensi/csm.git#tag=${_tag}")
md5sums=('SKIP')

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
  cmake ${srcdir}/csm \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/kinetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make -j2
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

