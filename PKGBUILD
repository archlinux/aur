pkgdesc="ROS - The gripper_action_controller package."
url='http://wiki.ros.org/gripper_action_controller'

pkgname='ros-noetic-gripper-action-controller'
pkgver='0.17.0'
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
sha256sums=('d1b46651956d19a36eedc628c2761526ec4769390e596bd76688abc45f59ace8')

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
