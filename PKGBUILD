# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Basic diagnostic_aggregator tests are in the."
url='https://wiki.ros.org/test_diagnostic_aggregator'

pkgname='ros-noetic-test-diagnostic-aggregator'
pkgver='1.9.3'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-noetic-diagnostic-msgs
	ros-noetic-rostest
	ros-noetic-catkin
	ros-noetic-roscpp
	ros-noetic-diagnostic-aggregator
	ros-noetic-rospy
	ros-noetic-pluginlib
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-diagnostic-msgs
	ros-noetic-roscpp
	ros-noetic-diagnostic-aggregator
	ros-noetic-rospy
	ros-noetic-pluginlib
)

depends=(
	${ros_depends[@]}
)

_dir="diagnostics-${pkgver}/test_diagnostic_aggregator"
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
