pkgdesc="ROS - hector_imu_attitude_to_tf is a lightweight node that can be used to publish the roll/pitch attitude angles reported via a imu message to tf."
url='https://wiki.ros.org/hector_imu_attitude_to_tf'

pkgname='ros-noetic-hector-imu-attitude-to-tf'
pkgver='0.5.2'
arch=('x86_64')
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
    ros-noetic-roscpp
    ros-noetic-sensor-msgs
    ros-noetic-tf
)

depends=(
    ${ros_depends[@]}
)

_dir="hector_slam-${pkgver}/hector_imu_attitude_to_tf"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tu-darmstadt-ros-pkg/hector_slam/archive/${pkgver}.tar.gz")
sha256sums=('c4c94b75062c1849c720b6c21d9fdea8dbd14e96a17c0ee80c630f3c8ea740fd')

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
