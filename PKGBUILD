# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Python implementation of the URDF parser."
url='http://wiki.ros.org/urdf_parser_py'

pkgname='ros-indigo-urdfdom-py'
pkgver='0.3.1'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-indigo-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2-catkin-pkg
  python2)

ros_depends=(ros-indigo-catkin)
depends=(${ros_depends[@]}
  python2-lxml
  python2)

# Git version (e.g. for debugging)
# _tag=release/indigo/urdfdom_py/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/urdfdom_py-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="urdfdom_py-release-release-indigo-urdfdom_py-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/urdfdom_py-release/archive/release/indigo/urdfdom_py/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('f59930b53943dab82db755333435316d7a567a0a691d76bb79ac221a5a9a9ac6')

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
