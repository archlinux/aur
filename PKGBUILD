# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - octomap_ros provides conversion functions between ROS and OctoMaps native types."
url='http://ros.org/wiki/octomap_ros'

pkgname='ros-melodic-octomap-ros'
pkgver='0.4.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-octomap
  ros-melodic-sensor-msgs
  ros-melodic-octomap-msgs
  ros-melodic-tf
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-octomap
  ros-melodic-tf
  ros-melodic-octomap-msgs
  ros-melodic-sensor-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/octomap_ros/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/octomap_ros-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="octomap_ros-release-release-melodic-octomap_ros"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/octomap_ros-release/archive/release/melodic/octomap_ros/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('a98ca796060418ec08813c8e69e73a376e9108194f9e626db5f56e8172dab4b9')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.8.so \
        -DPYTHON_BASENAME=-python3.8 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
