# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A library to access URDFs using the DOM model."
url='http://www.ros.org/'

pkgname='ros-ardent-urdfdom'
pkgver='0.3.0'
_pkgver_patch=11
arch=('any')
pkgrel=12
license=('BSD')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-urdfdom-headers
  ros-ardent-tinyxml-vendor
  ros-ardent-console-bridge)
depends=(${ros_depends[@]}
  tinyxml)

# Git version (e.g. for debugging)
# _tag=release/ardent/urdfdom/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/urdfdom-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="urdfdom-release-release-ardent-urdfdom-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/urdfdom-release/archive/release/ardent/urdfdom/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('dba6883b2da2370d2e3fb37f6cb83ba5d85fedc8051d38afe8b09ccc8a55d4a6')

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
