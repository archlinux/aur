# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - The pluginlib package provides tools for writing and dynamically loading plugins using the ROS build infrastructure."
url='http://www.ros.org/wiki/pluginlib'

pkgname='ros-noetic-pluginlib'
pkgver='1.12.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-class-loader
	ros-noetic-cmake-modules
	ros-noetic-catkin
	ros-noetic-rosconsole
	ros-noetic-roslib
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost
	tinyxml2
)

ros_depends=(
	ros-noetic-class-loader
	ros-noetic-rosconsole
	ros-noetic-roslib
)

depends=(
	${ros_depends[@]}
	boost
	tinyxml2
)

_dir="pluginlib-${pkgver}/pluginlib"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/pluginlib/archive/${pkgver}.tar.gz")
sha256sums=('d83289a919719c4cf97513c0a752eaf4a38ef17559e5ef676d29c8fb278ca82b')

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
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
