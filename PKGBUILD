# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - effort_controllers."
url='https://github.com/ros-controls/ros_controllers/wiki'

pkgname='ros-melodic-effort-controllers'
pkgver='0.17.1'
_pkgver_patch=1
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-forward-command-controller
  ros-melodic-realtime-tools
  ros-melodic-urdf
  ros-melodic-control-toolbox
  ros-melodic-control-msgs
  ros-melodic-controller-interface
  ros-melodic-angles
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-forward-command-controller
  ros-melodic-realtime-tools
  ros-melodic-urdf
  ros-melodic-control-toolbox
  ros-melodic-control-msgs
  ros-melodic-controller-interface
  ros-melodic-angles)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/effort_controllers/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_controllers-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_controllers-release-release-melodic-effort_controllers-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_controllers-release/archive/release/melodic/effort_controllers/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('c44f68422ffa5a4aaf2308d80264ac133ac7f48a0cba6cd56730c8fdda4dbb44')

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
        -DCATKIN_ENABLE_TESTING=0 \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
