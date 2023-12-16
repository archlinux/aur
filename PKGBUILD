pkgdesc="ROS - The gripper_action_controller package."
url='http://wiki.ros.org/gripper_action_controller'

pkgname='ros-noetic-gripper-action-controller'
pkgver='0.21.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
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
    ros-noetic-actionlib
    ros-noetic-angles
    ros-noetic-cmake-modules
    ros-noetic-control-msgs
    ros-noetic-control-toolbox
    ros-noetic-controller-interface
    ros-noetic-controller-manager
    ros-noetic-hardware-interface
    ros-noetic-realtime-tools
    ros-noetic-roscpp
    ros-noetic-trajectory-msgs
    ros-noetic-urdf
    ros-noetic-xacro
    ros-noetic-pluginlib
)

depends=(
    ${ros_depends[@]}
)

_dir="ros_controllers-${pkgver}/gripper_action_controller"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-controls/ros_controllers/archive/${pkgver}.tar.gz")
sha256sums=('19e710b944e972ffb7fadb2d149f97bcdc1c2c0cf38a20405c09afced1543ba4')

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
