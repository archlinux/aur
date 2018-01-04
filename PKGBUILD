# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Controller for a differential drive mobile base."
url='https://github.com/ros-controls/ros_controllers/wiki'

pkgname='ros-lunar-diff-drive-controller'
pkgver='0.13.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-catkin)
makedepends=(${ros_makedepends[@]}
  cmake
  ros-build-tools)

ros_depends=(ros-lunar-nav-msgs
  ros-lunar-realtime-tools
  ros-lunar-controller-interface
  ros-lunar-tf
  ros-lunar-urdf)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/lunar/diff_drive_controller/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_controllers-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_controllers-release-release-lunar-diff_drive_controller-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_controllers-release/archive/release/lunar/diff_drive_controller/${pkgver}-${_pkgver_patch}.tar.gz" )
sha256sums=('c2e24340c5d6f84e907f4ecbb10933e67707a6d160edbc2bc5f3b3638ea62e3c' )



build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 "${srcdir}/${_dir}"

  # Build project
  cmake "${srcdir}/${_dir}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/lunar \
        -DCMAKE_PREFIX_PATH=/opt/ros/lunar \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DCATKIN_ENABLE_TESTING=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
