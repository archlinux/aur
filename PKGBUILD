# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This package allows you to publish the state of a robot to tf."
url='https://wiki.ros.org/robot_state_publisher'

pkgname='ros-melodic-robot-state-publisher'
pkgver='1.14.1'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=4
license=('BSD')

ros_makedepends=(
	ros-melodic-tf2-kdl
	ros-melodic-rostime
	ros-melodic-catkin
	ros-melodic-tf
	ros-melodic-tf2-ros
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-kdl-parser
	ros-melodic-orocos-kdl
	ros-melodic-sensor-msgs
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	eigen
	urdfdom-headers
)

ros_depends=(
	ros-melodic-tf2-kdl
	ros-melodic-rostime
	ros-melodic-catkin
	ros-melodic-tf
	ros-melodic-tf2-ros
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-kdl-parser
	ros-melodic-orocos-kdl
	ros-melodic-sensor-msgs
)

depends=(
	${ros_depends[@]}
	eigen
)

_dir="robot_state_publisher-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/robot_state_publisher/archive/${pkgver}.tar.gz")
sha256sums=('68b3cf75308f17cc53a1d8b132b1b327afff46c2d1b373a998cd9a0f73bf2ec1')

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
