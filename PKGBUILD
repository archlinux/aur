# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - A Python GUI plugin for introspecting available ROS message types."
url='https://wiki.ros.org/rqt_msg'

pkgname='ros-noetic-rqt-msg'
pkgver='0.4.8'
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
)

ros_depends=(
	ros-noetic-rqt-py-common
	ros-noetic-rqt-gui-py
	ros-noetic-rosmsg
	ros-noetic-rqt-console
	ros-noetic-python-qt-binding
	ros-noetic-rqt-gui
	ros-noetic-rospy
	ros-noetic-roslib
)

depends=(
	${ros_depends[@]}
	python-rospkg
)

_dir="rqt_msg-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/rqt_msg/archive/${pkgver}.tar.gz")
sha256sums=('0f5a928077b9844b7aa558a80c9cc9171c5091868e58f6d0c02a1936c5d74757')

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
