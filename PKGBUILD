# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Tools for directing, throttling, selecting, and otherwise messing with ROS topics at a meta level."
url='https://wiki.ros.org/topic_tools'

pkgname='ros-noetic-topic-tools'
pkgver='1.15.13'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-xmlrpcpp
	ros-noetic-rostest
	ros-noetic-rosunit
	ros-noetic-catkin
	ros-noetic-message-generation
	ros-noetic-cpp-common
	ros-noetic-std-msgs
	ros-noetic-rosconsole
	ros-noetic-roscpp
	ros-noetic-rostime
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-rostime
	ros-noetic-xmlrpcpp
	ros-noetic-std-msgs
	ros-noetic-rosconsole
	ros-noetic-roscpp
	ros-noetic-message-runtime
)

depends=(
	${ros_depends[@]}
)

_dir="ros_comm-${pkgver}/tools/topic_tools"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/ros_comm/archive/${pkgver}.tar.gz")
sha256sums=('b676d6e688fe5ad78a9da9205477cc92ea6d54301f71caade1f27804d2d55000')

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
