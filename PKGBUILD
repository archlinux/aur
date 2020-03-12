# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - marti_common_msgs."
url='https://github.com/swri-robotics/marti_messages'

pkgname='ros-melodic-marti-common-msgs'
pkgver='0.8.0'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin
  ros-melodic-message-generation
  ros-melodic-std-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-message-runtime
  ros-melodic-std-msgs)
depends=(${ros_depends[@]})

_dir=marti_messages-release-release-melodic-marti_common_msgs
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/swri-robotics-gbp/marti_messages-release/archive/release/melodic/marti_common_msgs/${pkgver}.tar.gz")
sha256sums=('f55b0fa995a1e790ab27710ae2731eafa5ce43683fc9731e89674dd0542a58cb')

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
