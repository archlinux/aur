# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - diagnostic_updater contains tools for easily updating diagnostics."
url='https://wiki.ros.org/diagnostic_updater'

pkgname='ros-noetic-diagnostic-updater'
pkgver='1.10.3'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-rostest
	ros-noetic-diagnostic-msgs
	ros-noetic-catkin
	ros-noetic-std-msgs
	ros-noetic-roscpp
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-std-msgs
	ros-noetic-roscpp
	ros-noetic-diagnostic-msgs
)

depends=(
	${ros_depends[@]}
)

_dir="diagnostics-${pkgver}/diagnostic_updater"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/diagnostics/archive/${pkgver}.tar.gz")
sha256sums=('ab9637e43fe742e89e08a1d9389321c89fe1d3dbaa206df9a2e8f96456518068')

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
