# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - The diagnostic_analysis package can convert a log of diagnostics data into a series of CSV files."
url='https://www.wiki.ros.org/diagnostics_analysis'

pkgname='ros-noetic-diagnostic-analysis'
pkgver='1.9.3'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-noetic-rostest
	ros-noetic-diagnostic-msgs
	ros-noetic-rosbag
	ros-noetic-catkin
	ros-noetic-roslib
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-roslib
	ros-noetic-rosbag
	ros-noetic-diagnostic-msgs
)

depends=(
	${ros_depends[@]}
)

_dir="diagnostics-${pkgver}/diagnostic_analysis"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/diagnostics/archive/${pkgver}.tar.gz")
sha256sums=('3b2d3bb7bb333b8685fa084e086c00a044803dac41ff58351161440931d23550')

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
