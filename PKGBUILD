# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - Messages for (camera) view controllers."
url='http://ros.org/wiki/view_controller_msgs'

pkgname='ros-melodic-view-controller-msgs'
pkgver='0.1.3'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-std-msgs
  ros-melodic-geometry-msgs
  ros-melodic-genmsg
  ros-melodic-message-generation
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-geometry-msgs
  ros-melodic-std-msgs
  ros-melodic-message-runtime)
depends=(${ros_depends[@]})

_dir=view_controller_msgs-release-release-melodic-view_controller_msgs
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-gbp/view_controller_msgs-release/archive/release/melodic/view_controller_msgs/${pkgver}.tar.gz")
sha256sums=('6e5e0b26a1a1a739011f8b278f634f3ac2c4ca3809b4e6e6c36e58cb71fed15e')

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
