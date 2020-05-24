# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Launch files to open an RGBD device and load all nodelets to convert raw depth/RGB/IR streams to depth images, disparity images, and (registered) point clouds."
url='https://wiki.ros.org/rgbd_launch'

pkgname='ros-noetic-rgbd-launch'
pkgver='2.2.2'
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-noetic-image-proc
  ros-noetic-depth-image-proc
  ros-noetic-catkin
  ros-noetic-tf2-ros
  ros-noetic-nodelet)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-image-proc
  ros-noetic-depth-image-proc
  ros-noetic-tf2-ros
  ros-noetic-nodelet)
depends=(${ros_depends[@]})

_dir="rgbd_launch-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/rgbd_launch/archive/${pkgver}.tar.gz")
sha256sums=('2e4bebe8e9f2d9e23f6e0678f6e0f594cd3616f3db0724075bde7219637e6baa')

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
