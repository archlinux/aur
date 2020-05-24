# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - An rqt-based tool that assists monitoring tasks for MoveIt! motion planner developers and users."
url='https://wiki.ros.org/rqt_moveit'

pkgname='ros-noetic-rqt-moveit'
pkgver='0.5.7'
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
	ros-noetic-rqt-topic
	ros-noetic-rosnode
	ros-noetic-rostopic
	ros-noetic-python-qt-binding
	ros-noetic-rqt-gui
	ros-noetic-sensor-msgs
	ros-noetic-rospy
)

depends=(
	${ros_depends[@]}
)

_dir="rqt_moveit-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/rqt_moveit/archive/${pkgver}.tar.gz")
sha256sums=('80430ab344e096ae32caa505fb47f33ad52d77a83578ccb19950d097dee85e06')

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
