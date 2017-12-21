# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Implement the ROS middleware interface using eProsima FastRTPS static code generation in C++."
url='http://www.ros.org/'

pkgname='ros-ardent-rmw-fastrtps-cpp'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=(ros-ardent-ament-cmake-ros)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-rosidl-typesupport-introspection-cpp
  ros-ardent-ament-cmake
  ros-ardent-rosidl-typesupport-introspection-c
  ros-ardent-rosidl-generator-c
  ros-ardent-rmw
  ros-ardent-fastcdr
  ros-ardent-fastrtps-cmake-module
  ros-ardent-fastrtps
  ros-ardent-rcutils)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/ardent/rmw_fastrtps_cpp/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/rmw_fastrtps-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rmw_fastrtps-release-release-ardent-rmw_fastrtps_cpp-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/rmw_fastrtps-release/archive/release/ardent/rmw_fastrtps_cpp/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('91ac6f34d5ef9f882e82a5b68c2c8e54588893243cbe50e6938bb394e2d68823')

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
