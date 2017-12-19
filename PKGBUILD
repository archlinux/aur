# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Several default plugins for rviz to cover the basic functionality."
url='http://ros.org/wiki/rviz_default_plugins'

pkgname='ros-ardent-rviz-default-plugins'
pkgver='2.0.0'
_pkgver_patch=5
arch=('any')
pkgrel=6
license=('BSD')

ros_makedepends=(ros-ardent-ament-cmake)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-rviz-common
  ros-ardent-pluginlib
  ros-ardent-rviz-rendering
  ros-ardent-rclcpp)
depends=(${ros_depends[@]}
  qt5-base)

# Git version (e.g. for debugging)
# _tag=release/ardent/rviz_default_plugins/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/rviz-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rviz-release-release-ardent-rviz_default_plugins-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/rviz-release/archive/release/ardent/rviz_default_plugins/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('9d2762bb80026fb66848c3d0eb6204b3842a8300ecba1df82c73291f37c6b7ba')

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
