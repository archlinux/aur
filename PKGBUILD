# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Python implementation of bond, a mechanism for checking when another process has terminated."
url='https://wiki.ros.org/bondpy'

pkgname='ros-noetic-bondpy'
pkgver='1.8.3'
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-noetic-smclib
	ros-noetic-rospy
	ros-noetic-bond
	ros-noetic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-smclib
	ros-noetic-rospy
)

depends=(
	${ros_depends[@]}
	util-linux
)

_dir="bond_core-${pkgver}/bondpy"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/bond_core/archive/${pkgver}.tar.gz")
sha256sums=('9f2bd791abc0356f47235db7e2b042479e6a091cf2cd969d0918a8e0c76b632d')

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
