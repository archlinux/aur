pkgdesc="ROS - Example listener for Parker LORD Sensing inertial device driver ros_mscl (C++)."
url="https://github.com/LORD-MicroStrain/microstrain_inertial"

pkgname="ros-noetic-microstrain-inertial-examples"
pkgver="3.1.0"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=("MIT")

ros_makedepends=(
    ros-noetic-catkin
)

makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-roscpp
    ros-noetic-rospy
    ros-noetic-std-msgs
    ros-noetic-roslint
    ros-noetic-cmake-modules
    ros-noetic-sensor-msgs
    ros-noetic-microstrain-inertial-msgs
)

depends=(
    ${ros_depends[@]}
)

_dir="microstrain_inertial-${pkgver}/microstrain_inertial_examples"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LORD-MicroStrain/microstrain_inertial/archive/${pkgver}.tar.gz")
sha256sums=('939b19ad132e627ed72b410d7898154452fcea181c12533355a879d38c8bdeee')

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
