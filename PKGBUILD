# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This unary stack contains the dynamic_reconfigure package which provides a means to change node parameters at any time without having to restart the node."
url='https://wiki.ros.org/dynamic_reconfigure'

pkgname='ros-noetic-dynamic-reconfigure'
pkgver='1.7.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-rostest
	ros-noetic-catkin
	ros-noetic-message-generation
	ros-noetic-cpp-common
	ros-noetic-std-msgs
	ros-noetic-roscpp
	ros-noetic-roscpp-serialization
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost
)

ros_depends=(
	ros-noetic-rosservice
	ros-noetic-std-msgs
	ros-noetic-roscpp
	ros-noetic-message-runtime
	ros-noetic-rospy
	ros-noetic-roslib
)

depends=(
	${ros_depends[@]}
	boost
)

_dir="dynamic_reconfigure-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/dynamic_reconfigure/archive/${pkgver}.tar.gz")
sha256sums=('0264fb132be6545ce013fa9e0123aeb2bcdd1e77fdef37691f4fdb8053100951')

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

	# Create the build directory.
	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
	cd ${srcdir}/build

	# Build the project.
	cmake ${srcdir}/${_dir} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCATKIN_BUILD_BINARY_PACKAGE=ON \
		-DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
		-DPYTHON_EXECUTABLE=/usr/bin/python3 \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
