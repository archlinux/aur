pkgdesc="ROS - Packaging for URG Helper / URG Widget / URG Library / urg_c."
url="https://github.com/ros-drivers/urg_c"

pkgname='ros-noetic-urg-c'
pkgver='1.0.405'
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

ros_depends=()

depends=(
    ${ros_depends[@]}
)

_dir="urg_c-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ros-drivers/urg_c/archive/${pkgver}.tar.gz")
sha256sums=('9d1cd3cb8eafaec29d267196b375b33fa4f3ee035cd3f52888122a78f54e483f')

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
