# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A package containing some robot trajectory message definitions."
url='http://www.ros.org/'

pkgname='ros-ardent-trajectory-msgs'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=(ros-ardent-ament-cmake
  ros-ardent-rosidl-default-generators)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-std-msgs
  ros-ardent-builtin-interfaces
  ros-ardent-rosidl-default-runtime
  ros-ardent-geometry-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/ardent/trajectory_msgs/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/common_interfaces-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="common_interfaces-release-release-ardent-trajectory_msgs-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/common_interfaces-release/archive/release/ardent/trajectory_msgs/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('efaa3380397c7eb31914e7554a67c686d79b9030275ca305d9f0456646ca2128')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/ardent/setup.bash ] && source /opt/ros/ardent/setup.bash

  # Create build directory
  [ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 "${srcdir}/${_dir}"

  # Build project
  cmake "${srcdir}/${_dir}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/ardent \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.5m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.5m.so \
        -DPYTHON_BASENAME=.cpython-35m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DCATKIN_ENABLE_TESTING=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
