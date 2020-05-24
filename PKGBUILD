# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - slam_gmapping contains a wrapper around gmapping which provides SLAM capabilities."
url='http://ros.org/wiki/slam_gmapping'

pkgname='ros-noetic-slam-gmapping'
pkgver='1.4.1'
arch=('any')
pkgrel=1
license=('CreativeCommons-by-nc-sa-2.0')

ros_makedepends=(ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-gmapping
  ros-noetic-openslam-gmapping)
depends=(${ros_depends[@]})

_dir="slam_gmapping-${pkgver}/slam_gmapping"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/slam_gmapping/archive/${pkgver}.tar.gz")
sha256sums=('28429cf962b5ec2c49556aee73b7f87859c0421bc8c8056e3667e3a2b20591e2')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
