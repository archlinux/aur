# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - GPS messages and common routines for use in GPS drivers."
url='http://ros.org/wiki/gps_common'

pkgname='ros-melodic-gps-common'
pkgver='0.3.1'
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-melodic-catkin
  ros-melodic-rospy
  ros-melodic-roscpp
  ros-melodic-message-generation
  ros-melodic-message-filters
  ros-melodic-sensor-msgs
  ros-melodic-nav-msgs
  ros-melodic-std-msgs)
makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    )

ros_depends=(ros-melodic-rospy
  ros-melodic-message-runtime
  ros-melodic-roscpp
  ros-melodic-message-filters
  ros-melodic-sensor-msgs
  ros-melodic-nav-msgs
  ros-melodic-std-msgs)
depends=(${ros_depends[@]}
    )
_dir=gps_umd-release-release-melodic-gps_common
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/swri-robotics-gbp/gps_umd-release/archive/release/melodic/gps_common/${pkgver}.tar.gz")
sha256sums=('1d9813e1627fe1954b52a4ebeda1df840e8ca48c22cce267e55fb3674b603f6c')
build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

    # Create build directory
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    # Fix Python2/Python3 conflicts
    /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}
     
    # Build project
    cmake ${srcdir}/${_dir} \
            -DCMAKE_BUILD_TYPE=Release \
            -DCATKIN_BUILD_BINARY_PACKAGE=ON \
            -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
            -DPYTHON_EXECUTABLE=/usr/bin/python3 \
            -DPYTHON_INCLUDE_DIR=/usr/include/python3.8m \
            -DPYTHON_LIBRARY=/usr/lib/libpython3.8m.so \
            -DPYTHON_BASENAME=.cpython-38m \
            -DSETUPTOOLS_DEB_LAYOUT=OFF
    make
}

package() {
cd "${srcdir}/build"
make DESTDIR="${pkgdir}/" install
}
    
