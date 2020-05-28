# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Messages specific to MAV planning, especially polynomial."
url='https://wiki.ros.org/mav_comm'

pkgname='ros-noetic-mav-planning-msgs'
pkgver='3.3.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('ASL 2.0')

ros_makedepends=(
    ros-noetic-catkin
    ros-noetic-cmake-modules
)

makedepends=(
    cmake
    ros-build-tools
	${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-mav-msgs
    ros-noetic-message-generation
    ros-noetic-message-runtime
    ros-noetic-trajectory-msgs
    ros-noetic-geometry-msgs
    ros-noetic-sensor-msgs
    ros-noetic-std-msgs
)

depends=(
	${ros_depends[@]}
    eigen
)

_dir="mav_comm-${pkgver}/mav_planning_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ethz-asl/mav_comm/archive/${pkgver}.tar.gz")
sha256sums=('5c24fd711d32a024d226707aca6e18ed31e5ebd01e5bfe725098d07619223459')

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
