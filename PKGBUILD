# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - C++ implementation of bond, a mechanism for checking when another process has terminated."
url='https://www.wiki.ros.org/bondcpp'

pkgname='ros-noetic-bondcpp'
pkgver='1.8.5'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-cmake-modules
	ros-noetic-catkin
	ros-noetic-smclib
	ros-noetic-roscpp
	ros-noetic-bond
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost
	util-linux
)

ros_depends=(
	ros-noetic-roscpp
	ros-noetic-smclib
	ros-noetic-bond
)

depends=(
	${ros_depends[@]}
	boost
	util-linux
)


_dir="bond_core-${pkgver}/bondcpp"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/bond_core/archive/${pkgver}.tar.gz")
sha256sums=('19e683f3c1ce7ec442e0e46708cdf7bbbb48c2a14ca4cbca858609fc1be931c5')

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
