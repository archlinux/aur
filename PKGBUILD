# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Basic diagnostic_aggregator tests are in the."
url='https://wiki.ros.org/test_diagnostic_aggregator'

pkgname='ros-melodic-test-diagnostic-aggregator'
pkgver='1.9.7'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-melodic-diagnostic-msgs
	ros-melodic-rostest
	ros-melodic-catkin
	ros-melodic-roscpp
	ros-melodic-diagnostic-aggregator
	ros-melodic-rospy
	ros-melodic-pluginlib
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-diagnostic-msgs
	ros-melodic-roscpp
	ros-melodic-diagnostic-aggregator
	ros-melodic-rospy
	ros-melodic-pluginlib
)

depends=(
	${ros_depends[@]}
)

_dir="diagnostics-${pkgver}/test_diagnostic_aggregator"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/diagnostics/archive/${pkgver}.tar.gz")
sha256sums=('ca97cc9391fda16b48834c0bc5f745c67e59bd2cfc9b73f22a93406c4226c52a')

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

	# Create the build directory.
	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
	cd ${srcdir}/build

	# Fix Python2/Python3 conflicts.
	/usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

	# Build the project.
	cmake ${srcdir}/${_dir} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCATKIN_BUILD_BINARY_PACKAGE=ON \
		-DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
		-DPYTHON_EXECUTABLE=/usr/bin/python3 \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
