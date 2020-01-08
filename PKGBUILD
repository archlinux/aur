# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - effort_controllers."
url='https://github.com/ros-controls/ros_controllers/wiki'

pkgname='ros-melodic-effort-controllers'
pkgver='0.15.0'
_pkgver_patch=0
arch=('any')
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
sha256sums=('52db667f0de73f3ceff16dc3ec2d5e5c3b4a1d67ede0c58c89a53883f194821e')

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
