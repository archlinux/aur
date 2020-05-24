# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Tutorials showing how to write plugins for RViz."
url='https://wiki.ros.org/rviz_plugin_tutorials'

pkgname='ros-noetic-rviz-plugin-tutorials'
pkgver='0.10.3'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-noetic-rviz
	ros-noetic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	qt5-base
)

ros_depends=(
	ros-noetic-rviz
)

depends=(
	${ros_depends[@]}
	qt5-base
)

_dir="visualization_tutorials-${pkgver}/rviz_plugin_tutorials"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/visualization_tutorials/archive/${pkgver}.tar.gz")
sha256sums=('a3162d933fea0dd58b99e46fb71ea5d8596ef6e46eaf3a906e4bf20e9ca1bb1c')

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
