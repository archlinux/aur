# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Robot-independent Gazebo plugins for sensors, motors and dynamic reconfigurable components."
url='http://gazebosim.org/tutorials?cat=connect_ros'

pkgname='ros-lunar-gazebo-plugins'
pkgver='2.7.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD, Apache 2.0')

ros_makedepends=(ros-lunar-rospy
  ros-lunar-angles
  ros-lunar-diagnostic-updater
  ros-lunar-dynamic-reconfigure
  ros-lunar-nav-msgs
  ros-lunar-camera-info-manager
  ros-lunar-std-srvs
  ros-lunar-catkin
  ros-lunar-roscpp
  ros-lunar-tf
  ros-lunar-rosconsole
  ros-lunar-geometry-msgs
  ros-lunar-tf2-ros
  ros-lunar-sensor-msgs
  ros-lunar-message-generation
  ros-lunar-urdf
  ros-lunar-polled-camera
  ros-lunar-std-msgs
  ros-lunar-nodelet
  ros-lunar-image-transport
  ros-lunar-trajectory-msgs
  ros-lunar-rosgraph-msgs
  ros-lunar-gazebo-dev
  ros-lunar-gazebo-msgs
  ros-lunar-cv-bridge)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-lunar-rospy
  ros-lunar-angles
  ros-lunar-diagnostic-updater
  ros-lunar-dynamic-reconfigure
  ros-lunar-nav-msgs
  ros-lunar-message-runtime
  ros-lunar-camera-info-manager
  ros-lunar-std-srvs
  ros-lunar-roscpp
  ros-lunar-tf
  ros-lunar-rosconsole
  ros-lunar-geometry-msgs
  ros-lunar-tf2-ros
  ros-lunar-sensor-msgs
  ros-lunar-urdf
  ros-lunar-polled-camera
  ros-lunar-std-msgs
  ros-lunar-nodelet
  ros-lunar-image-transport
  ros-lunar-trajectory-msgs
  ros-lunar-rosgraph-msgs
  ros-lunar-gazebo-dev
  ros-lunar-gazebo-msgs
  ros-lunar-cv-bridge)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/lunar/gazebo_plugins/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/gazebo_ros_pkgs-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="gazebo_ros_pkgs-release-release-lunar-gazebo_plugins-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/gazebo_ros_pkgs-release/archive/release/lunar/gazebo_plugins/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('abd3b06a280e47cf51ca46e366a69448eeb67457222c3f63ee18b7f28432d42f')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/lunar \
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
