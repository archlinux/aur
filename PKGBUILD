pkgdesc="ROS - An automatically generated package with all the configuration and launch files for using the panda with the MoveIt! Motion Planning Framework"
url="http://wiki.ros.org/panda_moveit_config"

pkgname="ros-noetic-panda-moveit-config"
pkgver="0.7.5"
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
    ros-noetic-franka-description
    ros-noetic-moveit-ros-move-group
    ros-noetic-moveit-fake-controller-manager
    ros-noetic-moveit-kinematics
    ros-noetic-moveit-planners-ompl
    ros-noetic-moveit-ros-visualization
    ros-noetic-joint-state-publisher
    ros-noetic-joint-state-publisher-gui
    ros-noetic-robot-state-publisher
    ros-noetic-xacro
    ros-noetic-topic-tools
)

depends=(
    ${ros_depends[@]}
)

_dir="panda_moveit_config-$pkgver"
source=("${pkgname}-$pkgver.tar.gz"::"https://github.com/ros-planning/panda_moveit_config/archive/${pkgver}.tar.gz")
sha256sums=('c95013de637bae3d7f3f7b5adf10b664d47388439fe31dbdac653eb610164ce4')

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
