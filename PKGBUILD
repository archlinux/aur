# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Extra nodes and plugins for MAVROS."
url='http://wiki.ros.org/mavros_extras'

pkgname='ros-melodic-mavros-extras'
pkgver='0.26.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('GPLv3, LGPLv3, BSD')

ros_makedepends=(ros-melodic-std-msgs
  ros-melodic-tf
  ros-melodic-mavros
  ros-melodic-mavros-msgs
  ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-urdf
  ros-melodic-geometry-msgs
  ros-melodic-visualization-msgs
  ros-melodic-sensor-msgs
  ros-melodic-cmake-modules)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-tf
  ros-melodic-std-msgs
  ros-melodic-mavros-msgs
  ros-melodic-roscpp
  ros-melodic-urdf
  ros-melodic-geometry-msgs
  ros-melodic-mavros
  ros-melodic-visualization-msgs
  ros-melodic-sensor-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/mavros_extras/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/mavlink/mavros-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="mavros-release-release-melodic-mavros_extras-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/mavlink/mavros-release/archive/release/melodic/mavros_extras/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('74bc1807d8ea3db66f529238cd274f73b03001b8e114dbc024c911993841aad5')

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
