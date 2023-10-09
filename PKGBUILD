pkgdesc="ROS - Wrapper for the Hokuyo urg_c library."
url="https://github.com/ros-drivers/urg_node"

pkgname='ros-noetic-urg-node'
pkgver='0.1.18'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=("BSD")

ros_makedepends=(
    ros-noetic-catkin
)

makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-diagnostic-updater
    ros-noetic-dynamic-reconfigure
    ros-noetic-laser-proc
    ros-noetic-message-generation
    ros-noetic-nodelet
    ros-noetic-rosconsole
    ros-noetic-roscpp
    ros-noetic-sensor-msgs
    ros-noetic-std-msgs
    ros-noetic-std-srvs
    ros-noetic-tf
    ros-noetic-urg-c
    ros-noetic-message-runtime
    ros-noetic-xacro
    ros-noetic-roslint
    ros-noetic-roslaunch
)

depends=(
    ${ros_depends[@]}
)

_dir="urg_node-08b675c5285b6048f09ddce5fabaf525ad5b971c"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ros-drivers/urg_node/archive/08b675c5285b6048f09ddce5fabaf525ad5b971c.tar.gz")
sha256sums=('d2872307085313fbab2fcbca2bdabdaa17c718ca35d62016f17369593ef3f78a')

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
