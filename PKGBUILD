pkgdesc="ROS - A metapackage to bring in the default packages second generation Transform Library in ros, tf2."
url='https://wiki.ros.org/geometry2'

pkgname='ros-noetic-geometry2'
pkgver='0.7.5'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-tf2-sensor-msgs
    ros-noetic-tf2
    ros-noetic-tf2-eigen
    ros-noetic-tf2-py
    ros-noetic-tf2-tools
    ros-noetic-tf2-msgs
    ros-noetic-tf2-bullet
    ros-noetic-tf2-ros
    ros-noetic-tf2-kdl
    ros-noetic-tf2-geometry-msgs
)
depends=(
    ${ros_depends[@]}
)

_dir="geometry2-${pkgver}/geometry2"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/geometry2/archive/${pkgver}.tar.gz")
sha256sums=('0b5d461c71d6dc1dbdb99a2ba39e1515194cd451c2e53d53caadb3ecea13367a')

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
