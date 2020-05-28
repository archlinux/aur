# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - The rqt_rotors package"
url='https://wiki.ros.org/rotors_simulator'

pkgname='ros-noetic-rqt-rotors'
pkgver='2.2.3'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('ASL 2.0')

ros_makedepends=(
    ros-noetic-catkin
)

makedepends=(
    cmake
    ros-build-tools
	${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-mavros-msgs
    ros-noetic-rospy
    ros-noetic-rqt-gui-py
    ros-noetic-rqt-gui
)

depends=(
	${ros_depends[@]}
)

_dir="rotors_simulator-${pkgver}/rqt_rotors"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ethz-asl/rotors_simulator/archive/${pkgver}.tar.gz")
sha256sums=('46e6be40ebd08ba41a4a532c1774228d240d11aa39ad82f9ab50e445dc4a6f20')

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
