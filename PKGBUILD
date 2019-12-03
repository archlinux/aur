# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Launch files to open an RGBD device and load all nodelets to convert raw depth/RGB/IR streams to depth images, disparity images, and (registered) point clouds."
url='https://wiki.ros.org/rgbd_launch'

pkgname='ros-melodic-rgbd-launch'
pkgver='2.2.2'
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-melodic-image-proc
  ros-melodic-depth-image-proc
  ros-melodic-catkin
  ros-melodic-tf2-ros
  ros-melodic-nodelet)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-image-proc
  ros-melodic-depth-image-proc
  ros-melodic-tf2-ros
  ros-melodic-nodelet)
depends=(${ros_depends[@]})

_dir="rgbd_launch-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/rgbd_launch/archive/${pkgver}.tar.gz")
sha256sums=('2e4bebe8e9f2d9e23f6e0678f6e0f594cd3616f3db0724075bde7219637e6baa')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
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
