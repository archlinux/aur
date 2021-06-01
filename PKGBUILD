# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - hector_gazebo_plugins provides gazebo plugins from Team Hector."
url='https://wiki.ros.org/hector_gazebo_plugins'

pkgname='ros-noetic-hector-gazebo-plugins'
pkgver='0.5.3'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
    ros-noetic-roscpp
    ros-noetic-gazebo-dev
    ros-noetic-std-msgs
    ros-noetic-std-srvs
    ros-noetic-geometry-msgs
    ros-noetic-nav-msgs
    ros-noetic-tf
    ros-noetic-dynamic-reconfigure
    ros-noetic-message-generation
)

makedepends=(
    cmake
    ros-build-tools
	${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-roscpp
    ros-noetic-gazebo-ros
    ros-noetic-std-msgs
    ros-noetic-std-srvs
    ros-noetic-geometry-msgs
    ros-noetic-nav-msgs
    ros-noetic-tf
    ros-noetic-dynamic-reconfigure
    ros-noetic-message-runtime
)

depends=(
	${ros_depends[@]}
    gazebo
)

_dir="hector_gazebo-${pkgver}/hector_gazebo_plugins"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/tu-darmstadt-ros-pkg/hector_gazebo/archive/${pkgver}.tar.gz")
sha256sums=('cff34de0bb583a2b468ff7b130b729b79eccda59e481ac3a98bf16df68c8e9b5')

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

	# Create the build directory.
	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
	cd ${srcdir}/build

	# Build the project.
	cmake ${srcdir}/${_dir} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCATKIN_BUILD_BINARY_PACKAGE=ON \
		-DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
		-DPYTHON_EXECUTABLE=/usr/bin/python3 \
		-DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DCMAKE_CXX_STANDARD=17
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
