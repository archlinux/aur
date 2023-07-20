pkgdesc="ROS - Messages related to the Point Grey camera driver"
url='https://github.com/ros-drivers/pointgrey_camera_driver/tree/noetic-devel/image_exposure_msgs'

pkgname='ros-noetic-image-exposure-msgs'
pkgver='0.15.1'
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
    ros-noetic-statistics-msgs
    ros-noetic-std-msgs
    ros-noetic-message-generation
    ros-noetic-message-runtime
)

depends=(
    ${ros_depends[@]}
)

_dir="pointgrey_camera_driver-${pkgver}/image_exposure_msgs"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ros-drivers/pointgrey_camera_driver/archive/${pkgver}.tar.gz")
sha256sums=('f81a2ad2260a686bdd961d129d8f980b68454e70eb257fe3fdc39d4f5fcf53ad')

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
