# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgdesc="IMU Madgwick filter"
url='https://wiki.ros.org/imu_filter_madgwick?distro=noetic'

pkgname='ros-noetic-imu-filter-madgwick'
pkgver='1.2.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('GPL')

ros_makedepends=(
  ros-noetic-catkin
  ros-noetic-roscpp
  ros-noetic-sensor-msgs
  ros-noetic-geometry-msgs
  ros-noetic-tf2
  ros-noetic-tf2-geometry-msgs
  ros-noetic-tf2-ros
  ros-noetic-nodelet
  ros-noetic-pluginlib
  ros-noetic-message-filters
  ros-noetic-dynamic-reconfigure
)
makedepends=(
  cmake
  ros-build-tools
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-noetic-catkin
  ros-noetic-roscpp
  ros-noetic-sensor-msgs
  ros-noetic-geometry-msgs
  ros-noetic-tf2
  ros-noetic-tf2-geometry-msgs
  ros-noetic-tf2-ros
  ros-noetic-nodelet
  ros-noetic-pluginlib
  ros-noetic-message-filters
  ros-noetic-dynamic-reconfigure
)
depends=(
  ${ros_depends[@]}
)

# Tarball version (faster download)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ccny-ros-pkg/imu_tools/archive/${pkgver}.tar.gz")
sha256sums=('21a0759cba983595bfe5c09e8c85c5bd597ea8cafea7bb5259638b73e3f1c101')

build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Create build directory
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    # Build project
    cmake ${srcdir}/imu_tools-${pkgver}/imu_filter_madgwick \
            -DCMAKE_BUILD_TYPE=Release \
            -DCATKIN_BUILD_BINARY_PACKAGE=ON \
            -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
            -DPYTHON_EXECUTABLE=/usr/bin/python3 \
            -DSETUPTOOLS_DEB_LAYOUT=OFF
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
