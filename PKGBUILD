# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The class_loader package is a ROS-independent package for loading plugins during runtime and the foundation of the higher level ROS pluginlib library."
url='http://ros.org/wiki/class_loader'

pkgname='ros-ardent-class-loader'
pkgver='1.0.0'
_pkgver_patch=13
arch=('any')
pkgrel=14
license=('BSD')

ros_makedepends=(ros-ardent-ament-cmake)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-poco-vendor
  ros-ardent-console-bridge)
depends=(${ros_depends[@]}
  poco)

# Git version (e.g. for debugging)
# _tag=release/ardent/class_loader/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/class_loader-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="class_loader-release-release-ardent-class_loader-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/class_loader-release/archive/release/ardent/class_loader/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('4bb5ae220b2543adfea0e52bba59a8c370ce1325d7cd662aaabe7172c8163d96')

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
