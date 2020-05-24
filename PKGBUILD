# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Launch files to start the openni2_camera drivers using rgbd_launch."
url='https://wiki.ros.org/openni2_launch'

pkgname='ros-noetic-openni2-launch'
pkgver='0.4.2'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-rgbd-launch
  ros-noetic-openni2-camera
  ros-noetic-tf
  ros-noetic-nodelet
  ros-noetic-depth-image-proc
  ros-noetic-image-proc)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/openni2_launch/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/openni2_launch.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="openni2_camera-${pkgver}/openni2_launch"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/openni2_camera/archive/${pkgver}.tar.gz")
sha256sums=('98df75bef6d8865eab33ebeaec6b3bd098ca249b18c0e0459221483d51b0d2ca')

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
