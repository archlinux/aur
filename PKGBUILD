# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - A metapackage which extends ros_base and includes ROS libaries for any robot hardware."
url='https://wiki.ros.org/robot'

pkgname='ros-noetic-robot'
pkgver='1.4.1'
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
	ros-noetic-filters
	ros-noetic-ros-base
	ros-noetic-joint-state-publisher
	ros-noetic-executive-smach
	ros-noetic-urdf-parser-plugin
	ros-noetic-xacro
	ros-noetic-diagnostics
	ros-noetic-robot-state-publisher
	ros-noetic-kdl-parser-py
	ros-noetic-geometry
	ros-noetic-urdf
	ros-noetic-control-msgs
	ros-noetic-kdl-parser
)

depends=(
	${ros_depends[@]}
)

_dir="metapackages-${pkgver}/robot"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/metapackages/archive/${pkgver}.tar.gz")
sha256sums=('ef1df96c61c9762555174cc1a0e21e05149f74909d27044be0cd10aa065747a1')

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
