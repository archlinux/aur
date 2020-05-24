# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - The Kinematics and Dynamics Library (KDL) defines a tree structure to represent the kinematic and dynamic parameters of a robot mechanism."
url='https://wiki.ros.org/kdl_parser_py'

pkgname='ros-noetic-kdl-parser-py'
pkgver='1.13.1'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-noetic-orocos-kdl
	ros-noetic-urdf
	ros-noetic-catkin
	ros-noetic-rostest
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	python-catkin_pkg
)

ros_depends=(
	ros-noetic-orocos-kdl
	ros-noetic-urdf
	ros-noetic-python-orocos-kdl
	ros-noetic-urdfdom-py
)

depends=(
	${ros_depends[@]}
)

_dir="kdl_parser-${pkgver}/kdl_parser_py"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/kdl_parser/archive/${pkgver}.tar.gz")
sha256sums=('51378b09efc288ad91870322930f032f31a82e4a436865222b9990470995f67a')

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
