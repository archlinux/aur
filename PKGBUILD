# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Examples for composing multiple nodes in a single process."
url='http://www.ros.org/'

pkgname='ros-ardent-composition'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=(ros-ardent-rosidl-cmake
  ros-ardent-ament-cmake
  ros-ardent-rosidl-default-generators)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-rosidl-default-runtime
  ros-ardent-rclcpp
  ros-ardent-ament-index-cpp
  ros-ardent-example-interfaces
  ros-ardent-class-loader
  ros-ardent-std-msgs
  ros-ardent-rcutils)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/ardent/composition/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/demos-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="demos-release-release-ardent-composition-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/demos-release/archive/release/ardent/composition/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('f8e3cc005d9403bb34768fd9e597328577966d0f567241ccb92ac4a78ae0e952')

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
