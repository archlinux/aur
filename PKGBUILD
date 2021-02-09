# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - Messages for proprietary (non-NMEA) sentences from Novatel GPS receivers."
url='h'

pkgname='ros-melodic-novatel-gps-msgs'
pkgver='3.9.0'
arch=('any')
pkgrel=2
license=('Southwest Research Institute Proprietary')

ros_makedepends=(ros-melodic-message-generation
  ros-melodic-std-msgs
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    )

ros_depends=(ros-melodic-message-runtime
  ros-melodic-std-msgs)
depends=(${ros_depends[@]}
    )

_dir="novatel_gps_driver/novatel_gps_msgs" 
_commit='1a4626fda13b89dfca504e717b8cf7cb25314499'
source=("git://github.com/swri-robotics/novatel_gps_driver.git#commit=${_commit}")
sha256sums=('SKIP')

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
    
