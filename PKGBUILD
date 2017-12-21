# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A simple bridge between ROS 1 and ROS 2."
url='http://www.ros.org/'

pkgname='ros-ardent-ros1-bridge'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=(ros-ardent-ament-index-python
  ros-ardent-rmw-implementation-cmake
  ros-ardent-ament-cmake
  ros-ardent-rosidl-cmake
  ros-ardent-rosidl-parser)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  pkg-config)

ros_depends=(ros-ardent-sensor-msgs
  ros-ardent-nav-msgs
  ros-ardent-rcutils
  ros-ardent-shape-msgs
  ros-ardent-std-srvs
  ros-ardent-visualization-msgs
  ros-ardent-trajectory-msgs
  ros-ardent-actionlib-msgs
  ros-ardent-std-msgs
  ros-ardent-tf2-msgs
  ros-ardent-diagnostic-msgs
  ros-ardent-stereo-msgs
  ros-ardent-geometry-msgs
  ros-ardent-rclcpp)
depends=(${ros_depends[@]}
  python-yaml)

# Git version (e.g. for debugging)
# _tag=release/ardent/ros1_bridge/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/ros1_bridge-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros1_bridge-release-release-ardent-ros1_bridge-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/ros1_bridge-release/archive/release/ardent/ros1_bridge/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('cbef6ad7a2bd7e5efb81b57d9c5ebb5b005d0539f45b8b305599e46681a10219')

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
