# Maintainer: DanielNak <daniel@tee.cat>

pkgname=ros-noetic-teb-local-planner
pkgver=0.9.1
pkgdesc="A plugin for the ROS base_local_planner of the 2D navigation stack."
url='http://wiki.ros.org/teb_local_planner'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
  ros-noetic-mbf-costmap-core
  ros-noetic-interactive-markers
  ros-noetic-tf2-eigen
  ros-noetic-costmap-2d
  ros-noetic-costmap-converter
  ros-noetic-pluginlib
  ros-noetic-mbf-msgs
  ros-noetic-visualization-msgs
  ros-noetic-nav-core
  ros-noetic-nav-msgs
  ros-noetic-std-msgs
  ros-noetic-cmake-modules
  ros-noetic-geometry-msgs
  ros-noetic-catkin
  ros-noetic-roscpp
  ros-noetic-tf2-geometry-msgs
  ros-noetic-base-local-planner
  ros-noetic-message-generation
  ros-noetic-tf2-ros
  ros-noetic-tf2
  ros-noetic-dynamic-reconfigure
  ros-noetic-libg2o
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-noetic-mbf-costmap-core
  ros-noetic-visualization-msgs
  ros-noetic-base-local-planner
  ros-noetic-interactive-markers
  ros-noetic-nav-core
  ros-noetic-roscpp
  ros-noetic-nav-msgs
  ros-noetic-costmap-2d
  ros-noetic-message-runtime
  ros-noetic-costmap-converter
  ros-noetic-pluginlib
  ros-noetic-tf2
  ros-noetic-mbf-msgs
  ros-noetic-dynamic-reconfigure
  ros-noetic-std-msgs
  ros-noetic-tf2-ros
  ros-noetic-geometry-msgs
  ros-noetic-libg2o
)

depends=(
  ${ros_depends[@]}
)

# Tarball version (faster download)
_dir="teb_local_planner-release-release-noetic-teb_local_planner"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/rst-tu-dortmund/teb_local_planner-release/archive/release/noetic/teb_local_planner/${pkgver}.tar.gz")
sha256sums=('66d5084fb68aaa15befd6f4be6c3133082583d4e7f13e1c28b37d2f87d0c6280')

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
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
