# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Interface for enforcing joint limits."
url='https://github.com/ros-controls/ros_control/wiki'

pkgname='ros-melodic-joint-limits-interface'
pkgver='0.18.4'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-urdf
  ros-melodic-roscpp
  ros-melodic-hardware-interface
  ros-melodic-catkin
  ros-melodic-rostest)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  urdfdom)

ros_depends=(ros-melodic-urdf
  ros-melodic-roscpp
  ros-melodic-hardware-interface)
depends=(${ros_depends[@]}
  urdfdom)

# Git version (e.g. for debugging)
# _tag=release/melodic/joint_limits_interface/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_control-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_control-${pkgver}/joint_limits_interface"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-controls/ros_control/archive/${pkgver}.tar.gz")
sha256sums=('c4e289e2bfafb418c22cf31f8fb656b697b1629a51631bdc12a3f3ed4e59af20')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
