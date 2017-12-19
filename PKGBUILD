# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS -  amcl is a probabilistic localization system for a robot moving in 2D."
url='http://wiki.ros.org/amcl'

pkgname='ros-ardent-amcl'
pkgver='3.0.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('LGPL')

ros_makedepends=(ros-ardent-ament-cmake-ros
  ros-ardent-ament-cmake-auto)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-geometry-msgs
  ros-ardent-tf2-msgs
  ros-ardent-nav-msgs
  ros-ardent-std-srvs
  ros-ardent-tf2-ros
  ros-ardent-rclcpp
  ros-ardent-tf2
  ros-ardent-tf2-geometry-msgs
  ros-ardent-sensor-msgs
  ros-ardent-rcutils)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/ardent/amcl/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-release-release-ardent-amcl-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/navigation-release/archive/release/ardent/amcl/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('8e1e34ab19a064819f2a3d2cf8ad5c2c48bc72d07856483f9601ce2039fa0312')

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
