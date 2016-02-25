# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package contains a tool for setting and publishing joint state values for a given URDF."
url='http://www.ros.org/wiki/joint_state_publisher'

pkgname='ros-jade-joint-state-publisher'
pkgver='1.11.10'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-sensor-msgs
  ros-jade-catkin
  ros-jade-rospy)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  wxpython)

ros_depends=(ros-jade-sensor-msgs
  ros-jade-rospy)
depends=(${ros_depends[@]}
  wxpython)

# Git version (e.g. for debugging)
# _tag=release/jade/joint_state_publisher/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/robot_model-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="robot_model-release-release-jade-joint_state_publisher-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/robot_model-release/archive/release/jade/joint_state_publisher/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('1e6c6c6b15c3b8d42b9327f7c83eaf16ad9ef28ecd065c35054ba9efd31fa4bc')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/jade/setup.bash ] && source /opt/ros/jade/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/jade \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
