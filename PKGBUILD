# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This package contains a number of URDF tutorials."
url='https://wiki.ros.org/urdf_tutorial'

pkgname='ros-noetic-urdf-tutorial'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-noetic-catkin
	ros-noetic-roslaunch
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-xacro
	ros-noetic-joint-state-publisher
	ros-noetic-rviz
	ros-noetic-robot-state-publisher
)

depends=(
	${ros_depends[@]}
)

_dir="urdf_tutorial-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/urdf_tutorial/archive/${pkgver}.tar.gz")
sha256sums=('d918909e6ec039423b434efe44b7a9fa08ea21b43f64c314b985b9c134d9921d')

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
