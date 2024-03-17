pkgdesc="ROS - The rtcm_msgs package contains messages related to data in the RTCM format."
url="https://github.com/tilk/rtcm_msgs"

pkgname="ros-noetic-rtcm-msgs"
pkgver="1.1.6"
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
    ros-noetic-message-generation
    ros-noetic-message-runtime
)

depends=(
    ${ros_depends[@]}
)

_dir="rtcm_msgs-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tilk/rtcm_msgs/archive/${pkgver}.tar.gz")
sha256sums=('ee6edd7fe468034a4b1ba8321eedf5e9374a8eeedfbe4991fc28a4a51807235d')


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
