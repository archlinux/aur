pkgdesc="ROS - Message and service types: custom messages and services for TurtleBot3 packages"
url='https://wiki.ros.org/turtlebot3_msgs'

pkgname='ros-noetic-turtlebot3-msgs'
pkgver='1.0.0'
arch=('any')
pkgrel=2
license=('Apache-2.0')

ros_makedepends=(
	ros-noetic-catkin
	ros-noetic-message-generation
	ros-noetic-message-runtime
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-std-msgs
    ros-noetic-message-runtime
)

depends=(
	${ros_depends[@]}
)

_dir="turtlebot3_msgs-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ROBOTIS-GIT/turtlebot3_msgs/archive/${pkgver}.tar.gz")
sha256sums=('61d1389c9a135b9aa922cf19c69347f3abfe4f2c893bd2e59aaff7dff71020e8')

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
