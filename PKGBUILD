# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The ROS client library in C++."
url='http://www.ros.org/'

pkgname='ros-ardent-rclcpp'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-rmw-implementation
  ros-ardent-ament-cmake
  ros-ardent-rcl
  ros-ardent-rmw
  ros-ardent-rosidl-generator-cpp
  ros-ardent-builtin-interfaces
  ros-ardent-rosidl-typesupport-c
  ros-ardent-rosidl-typesupport-cpp
  ros-ardent-rcl-interfaces)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/ardent/rclcpp/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/rclcpp-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rclcpp-release-release-ardent-rclcpp-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/rclcpp-release/archive/release/ardent/rclcpp/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('5613bbbadb0f3be8c0fea6d267b761d363b137613ae2875c83f124f88f068ba0')

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
