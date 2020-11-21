# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - slam_gmapping contains a wrapper around gmapping which provides SLAM capabilities."
url='http://ros.org/wiki/slam_gmapping'

pkgname='ros-melodic-slam-gmapping'
pkgver='1.4.1'
_pkgver_patch=1
arch=('any')
pkgrel=1
license=('CreativeCommons-by-nc-sa-2.0')

ros_makedepends=(ros-melodic-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-gmapping
  ros-melodic-openslam-gmapping)
depends=(${ros_depends[@]})

_tag=release/melodic/slam_gmapping/${pkgver}-${_pkgver_patch}
_dir=slam_gmapping
source=("${_dir}"::"git+https://github.com/ros-gbp/slam_gmapping-release.git"#tag=${_tag})
md5sums=('SKIP')

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
