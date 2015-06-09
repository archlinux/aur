# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Components of MoveIt connecting to perception."
url='http://moveit.ros.org'

pkgname='ros-indigo-moveit-ros-perception'
pkgver='0.6.5'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-octomap
  ros-indigo-roscpp
  ros-indigo-cv-bridge
  ros-indigo-catkin
  ros-indigo-image-transport
  ros-indigo-rosconsole
  ros-indigo-pcl-conversions
  ros-indigo-moveit-core
  ros-indigo-tf-conversions
  ros-indigo-cmake-modules
  ros-indigo-tf
  ros-indigo-urdf
  ros-indigo-message-filters
  ros-indigo-pluginlib)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  glew
  mesa
  freeglut)

ros_depends=(ros-indigo-octomap
  ros-indigo-roscpp
  ros-indigo-cv-bridge
  ros-indigo-image-transport
  ros-indigo-rosconsole
  ros-indigo-pcl-conversions
  ros-indigo-moveit-core
  ros-indigo-tf-conversions
  ros-indigo-tf
  ros-indigo-urdf
  ros-indigo-message-filters
  ros-indigo-pluginlib)
depends=(${ros_depends[@]}
  glew
  mesa
  freeglut)

_tag=release/indigo/moveit_ros_perception/${pkgver}-${_pkgver_patch}
_dir=moveit_ros_perception
source=("${_dir}"::"git+https://github.com/ros-gbp/moveit_ros-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-lpython2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
