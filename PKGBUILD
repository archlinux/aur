pkgdesc="ROS - Example listener for Parker LORD Sensing inertial device driver ros_mscl (C++)."
url="https://github.com/LORD-MicroStrain/microstrain_inertial"

pkgname="ros-noetic-microstrain-inertial-examples"
pkgver="4.0.1"
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

_commit="6a2f27040934d862963999afbb2456f7cb2fa02b"
_dir="microstrain_inertial-${_commit}/microstrain_inertial_examples"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LORD-MicroStrain/microstrain_inertial/archive/${_commit}.tar.gz")
sha256sums=('8b9ebb1073dee8cc3d1062390aa3809ca9138b0d014b83bc3ec3feb7de392929')

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
