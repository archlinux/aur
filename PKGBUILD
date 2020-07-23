pkgdesc="ROS - Special Messages for PlotJuggler"
url='https://www.plotjuggler.io'

pkgname='ros-noetic-plotjuggler-msgs'
pkgver='0.1.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('MIT')

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
    ros-noetic-std-msgs
)

depends=(
    ${ros_depends[@]}
)

_dir="plotjuggler_msgs-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/facontidavide/plotjuggler_msgs/archive/${pkgver}.tar.gz")
sha256sums=('29956629259fe84f72cdb8b0072db17687dadaa292069ee83c0bedf436d0f5d8')

build() {
    # Use ROS environment variables.
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Create the build directory.
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    # Build the project.
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
