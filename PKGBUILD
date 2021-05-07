# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - diagnostic_common_diagnostics."
url='https://wiki.ros.org/diagnostic_common_diagnostics'

pkgname='ros-noetic-diagnostic-common-diagnostics'
pkgver='1.10.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-rostest
	ros-noetic-rospy
	ros-noetic-catkin
	ros-noetic-diagnostic-updater
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-tf
	ros-noetic-rospy
	ros-noetic-diagnostic-updater
)

depends=(
	${ros_depends[@]}
	python-psutil
	hddtemp
)

_dir="diagnostics-${pkgver}/diagnostic_common_diagnostics"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/diagnostics/archive/${pkgver}.tar.gz")
sha256sums=('70935296661d052397deea4a5cb3105ac5cf35843bf2d45b34f1f1a39c3552ec')

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
