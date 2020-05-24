# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A metapackage of Emacs utils for ROS."
url='https://wiki.ros.org/ros_emacs_utils'

pkgname='ros-noetic-ros-emacs-utils'
pkgver='0.4.13'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-slime-wrapper
  ros-noetic-slime-ros
  ros-noetic-rosemacs
  ros-noetic-roslisp-repl)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/ros_emacs_utils/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/code-iai-release/ros_emacs_utils-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_emacs_utils-${pkgver}/ros_emacs_utils"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/code-iai/ros_emacs_utils/archive/${pkgver}.tar.gz")
sha256sums=('14c8463b3c354a53659843c82af416a4ff6713747f04da98e8fc39de90c8ec6c')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
