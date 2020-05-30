# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This package contains a tool for setting and publishing joint state values for a given URDF."
url='https://wiki.ros.org/joint_state_publisher'

pkgname='ros-noetic-joint-state-publisher'
pkgver='1.12.13'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-noetic-catkin
	ros-noetic-rostest
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-python-qt-binding
	ros-noetic-sensor-msgs
	ros-noetic-rospy
)

depends=(
	${ros_depends[@]}
)

_dir="joint_state_publisher-${pkgver}/joint_state_publisher"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/joint_state_publisher/archive/${pkgver}.tar.gz")
sha256sums=('7143e42232af0f5cef5413b0f543e951fe81fa673d2ad7b67d0f681da3597600')

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
