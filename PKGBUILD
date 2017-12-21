# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Package containing the Python client."
url='http://www.ros.org/'

pkgname='ros-ardent-rclpy'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=(ros-ardent-rmw-implementation-cmake
  ros-ardent-ament-cmake
  ros-ardent-python-cmake-module
  ros-ardent-rcutils)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-rcl
  ros-ardent-ament-index-python
  ros-ardent-rmw-implementation)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/ardent/rclpy/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/rclpy-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rclpy-release-release-ardent-rclpy-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/rclpy-release/archive/release/ardent/rclpy/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('d31b275331e815ac8b24318f3f61fe3dd41e1a2e8443b132437f110966d8bedf')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/ardent/setup.bash ] && source /opt/ros/ardent/setup.bash

  # Create build directory
  [ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 "${srcdir}/${_dir}"

  export PYTHONPATH=/opt/ros/ardent/lib/python3.6/site-packages
  export AMENT_PREFIX_PATH=/opt/ros/ardent

  # Build project
  cmake "${srcdir}/${_dir}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=Off \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/ardent
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
