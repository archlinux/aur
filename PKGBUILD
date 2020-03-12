# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - swri_roscpp."
url='http://www.ros.org/'

pkgname='ros-melodic-swri-roscpp'
pkgver='2.11.0'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-nav-msgs
  ros-melodic-dynamic-reconfigure
  ros-melodic-std-msgs
  ros-melodic-marti-common-msgs
  ros-melodic-std-srvs
  ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-diagnostic-updater)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-nav-msgs
  ros-melodic-dynamic-reconfigure
  ros-melodic-std-msgs
  ros-melodic-marti-common-msgs
  ros-melodic-std-srvs
  ros-melodic-roscpp
  ros-melodic-diagnostic-updater)
depends=(${ros_depends[@]})

_dir=marti_common-release-release-melodic-swri_roscpp
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/swri-robotics-gbp/marti_common-release/archive/release/melodic/swri_roscpp/${pkgver}.tar.gz")
sha256sums=('2fca22980b77828c4c7a4ce024123a82ebc4b3f513ca147c384751a03e6396a3')

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
