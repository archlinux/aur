pkgdesc="ROS - Interactive control for generic Twist-based robots using interactive markers."
url='https://wiki.ros.org/interactive_marker_twist_server'

pkgname='ros-noetic-interactive-marker-twist-server'
pkgver='1.2.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
    ros-noetic-interactive-markers
    ros-noetic-roscpp
    ros-noetic-tf
    ros-noetic-visualization-msgs
    ros-noetic-roslint
)

makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-interactive-markers
    ros-noetic-roscpp
    ros-noetic-tf
    ros-noetic-visualization-msgs
)

depends=(
    ${ros_depends[@]}
)

_dir="interactive_marker_twist_server-${pkgver}/"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/interactive_marker_twist_server/archive/${pkgver}.tar.gz")
sha256sums=('5c8a54aba2b4811a0da537e510301ac717031442147ddf2ef3d4bf92c5fed7fc')

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

