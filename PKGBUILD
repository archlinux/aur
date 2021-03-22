# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Launch files to start the openni2_camera drivers using rgbd_launch."
url='https://wiki.ros.org/openni2_launch'

pkgname='ros-melodic-openni2-launch'
pkgver='1.5.1'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-rgbd-launch
  ros-melodic-openni2-camera
  ros-melodic-tf
  ros-melodic-nodelet
  ros-melodic-depth-image-proc
  ros-melodic-image-proc)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/openni2_launch/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/openni2_launch.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="openni2_camera-${pkgver}/openni2_launch"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/openni2_camera/archive/${pkgver}.tar.gz")
sha256sums=('d70c3808743b541c933e9ef46730a6bd481b64e8c8e410b8be6b03390093a36b')

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
        -DPYTHON_BASENAME=.cpython37m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
