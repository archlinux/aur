# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Tests for MAVROS package."
url='http://www.ros.org/'

pkgname='ros-melodic-test-mavros'
pkgver='0.26.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD, GPLv3, LGPLv3')

ros_makedepends=(ros-melodic-mavros-extras
  ros-melodic-std-msgs
  ros-melodic-eigen-conversions
  ros-melodic-angles
  ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-tf2-ros
  ros-melodic-geometry-msgs
  ros-melodic-control-toolbox
  ros-melodic-mavros
  ros-melodic-cmake-modules)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3)

ros_depends=(ros-melodic-mavros-extras
  ros-melodic-mavros
  ros-melodic-eigen-conversions
  ros-melodic-std-msgs
  ros-melodic-roscpp
  ros-melodic-tf2-ros
  ros-melodic-geometry-msgs
  ros-melodic-control-toolbox)
depends=(${ros_depends[@]}
  eigen3)

# Git version (e.g. for debugging)
# _tag=release/melodic/test_mavros/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/mavlink/mavros-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="mavros-release-release-melodic-test_mavros-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/mavlink/mavros-release/archive/release/melodic/test_mavros/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('f7b16031473545fdf11d5931e5582169bde11acc83167ea2092524ece2521946')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DPYTHON_BASENAME=.cpython-37m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
