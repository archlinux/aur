# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - Driver for NovAtel receivers."
url='http://www.ros.org/'

pkgname='ros-melodic-novatel-gps-driver'
pkgver='3.9.0'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-roscpp
  ros-melodic-novatel-gps-msgs
  ros-melodic-tf
  ros-melodic-gps-common
  ros-melodic-catkin
  ros-melodic-swri-roscpp
  ros-melodic-std-msgs
  ros-melodic-diagnostic-updater
  ros-melodic-nodelet
  ros-melodic-swri-string-util
  ros-melodic-swri-math-util
  ros-melodic-diagnostic-msgs
  ros-melodic-swri-nodelet
  ros-melodic-swri-serial-util
  ros-melodic-sensor-msgs
  ros-melodic-nav-msgs)
makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    boost
    libpcap)

ros_depends=(ros-melodic-roscpp
  ros-melodic-novatel-gps-msgs
  ros-melodic-tf
  ros-melodic-gps-common
  ros-melodic-swri-roscpp
  ros-melodic-std-msgs
  ros-melodic-diagnostic-updater
  ros-melodic-nodelet
  ros-melodic-swri-string-util
  ros-melodic-swri-math-util
  ros-melodic-diagnostic-msgs
  ros-melodic-swri-nodelet
  ros-melodic-swri-serial-util
  ros-melodic-sensor-msgs
  ros-melodic-nav-msgs)
depends=(${ros_depends[@]}
    boost
    libpcap)
   
 _dir=novatel_gps_driver-release-release-melodic-novatel_gps_driver
source=(""${pkgname}-${pkgver}.tar.gz""::""https://github.com/swri-robotics-gbp/novatel_gps_driver-release/archive/release/melodic/novatel_gps_driver/${pkgver}.tar.gz"")
sha256sums=('2812566bfc3ea44b10f7abe8fd1e94f5228eec7f497d832ea87330c68c2f9e68')

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
    
