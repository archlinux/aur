# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Robot-independent Gazebo plugins for sensors, motors and dynamic reconfigurable components."
url='http://gazebosim.org/tutorials?cat=connect_ros'

pkgname='ros-jade-gazebo-plugins'
pkgver='2.5.5'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD, Apache 2.0')

ros_makedepends=(ros-jade-rosgraph-msgs
  ros-jade-message-generation
  ros-jade-rostest
  ros-jade-diagnostic-updater
  ros-jade-nodelet
  ros-jade-roscpp
  ros-jade-trajectory-msgs
  ros-jade-tf
  ros-jade-driver-base
  ros-jade-polled-camera
  ros-jade-geometry-msgs
  ros-jade-camera-info-manager
  ros-jade-image-transport
  ros-jade-angles
  ros-jade-std-msgs
  ros-jade-std-srvs
  ros-jade-dynamic-reconfigure
  ros-jade-urdf
  ros-jade-cv-bridge
  ros-jade-gazebo-msgs
  ros-jade-nav-msgs
  ros-jade-catkin
  ros-jade-tf2-ros
  ros-jade-sensor-msgs
  ros-jade-rosconsole
  ros-jade-rospy)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  gazebo)

ros_depends=(ros-jade-rosgraph-msgs
  ros-jade-message-generation
  ros-jade-rostest
  ros-jade-nodelet
  ros-jade-roscpp
  ros-jade-trajectory-msgs
  ros-jade-tf
  ros-jade-driver-base
  ros-jade-gazebo-ros
  ros-jade-polled-camera
  ros-jade-geometry-msgs
  ros-jade-camera-info-manager
  ros-jade-image-transport
  ros-jade-angles
  ros-jade-std-msgs
  ros-jade-std-srvs
  ros-jade-dynamic-reconfigure
  ros-jade-urdf
  ros-jade-cv-bridge
  ros-jade-gazebo-msgs
  ros-jade-nav-msgs
  ros-jade-tf2-ros
  ros-jade-sensor-msgs
  ros-jade-rosconsole
  ros-jade-rospy)
depends=(${ros_depends[@]}
  gazebo)

# Git version (e.g. for debugging)
# _tag=release/jade/gazebo_plugins/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/gazebo_ros_pkgs-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="gazebo_ros_pkgs-release-release-jade-gazebo_plugins-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/gazebo_ros_pkgs-release/archive/release/jade/gazebo_plugins/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('8599215aefc2a758c686626f4a0e72b8e9305c5f1a307be3aca6b8f267b3e32a')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DCMAKE_CXX_FLAGS="--std=c++11"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
