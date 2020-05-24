# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This package contains a C++ base class for URDF parsers."
url='https://wiki.ros.org/urdf'

pkgname='ros-noetic-urdf-parser-plugin'
pkgver='1.13.1'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-noetic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	urdfdom-headers
)

ros_depends=(
)

depends=(
	${ros_depends[@]}
	urdfdom-headers
)

_dir="urdf-${pkgver}/urdf_parser_plugin"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/urdf/archive/${pkgver}.tar.gz")
sha256sums=('9959b9963a5c112f71995405e8aa6d4dcf634e9f38f061ed7577d3db449179d6')

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
