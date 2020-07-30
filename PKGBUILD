pkgdesc="ROS - Object_recognition_msgs contains the ROS message and the actionlib definition used in object_recognition_core."
url='https://wiki.ros.org/object_recognition_msgs'

pkgname='ros-noetic-object-recognition-msgs'
pkgver='0.4.2'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-geometry-msgs
    ros-noetic-message-generation
    ros-noetic-actionlib-msgs
    ros-noetic-std-msgs
    ros-noetic-sensor-msgs
    ros-noetic-catkin
    ros-noetic-shape-msgs
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-geometry-msgs
    ros-noetic-actionlib-msgs
    ros-noetic-message-runtime
    ros-noetic-std-msgs
    ros-noetic-sensor-msgs
    ros-noetic-shape-msgs
)
depends=(
    ${ros_depends[@]}
)

_dir="object_recognition_msgs-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/wg-perception/object_recognition_msgs/archive/${pkgver}.tar.gz")
sha256sums=('7377cb764799d30fd2812d0ef1ff52e5f5c5479bced087c45ef478195f941f16')

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
