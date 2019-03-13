# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Mobile robot simulator http://rtv.github.com/Stage."
url='http://rtv.github.com/Stage'

pkgname='ros-kinetic-stage'
pkgver='4.3.0'
_pkgver_patch=0
arch=('any')
pkgrel=11
license=('GPL')

ros_makedepends=()
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  fltk
  libjpeg-turbo
  gtk2
  libtool
  mesa
  pkg-config)

ros_depends=(ros-kinetic-catkin)
depends=(${ros_depends[@]}
  libjpeg-turbo
  mesa
  fltk
  gtk2)

_tag=release/kinetic/stage/${pkgver}-${_pkgver_patch}
_dir=stage
source=("${_dir}"::"git+https://github.com/rtv/Stage.git"#commit=0c85412d99ecb134088a2b72d541938e5d0657f1)
md5sums=('SKIP')

#prepare() {
# unzip stage.hh.diff.zip
# cd $pkgname-$pkgver
# patch -Np1 -i "${srcdir}/eject.patch"
#}


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

