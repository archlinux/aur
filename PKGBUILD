# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - turtle_actionlib demonstrates how to write an action server and client with the turtlesim."
url='https://wiki.ros.org/turtle_actionlib'

pkgname='ros-melodic-turtle-actionlib'
pkgver='0.1.11'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=4
license=('BSD')

ros_makedepends=(
	ros-melodic-angles
	ros-melodic-turtlesim
	ros-melodic-catkin
	ros-melodic-message-generation
	ros-melodic-actionlib-msgs
	ros-melodic-actionlib
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-std-msgs
	ros-melodic-geometry-msgs
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-angles
	ros-melodic-turtlesim
	ros-melodic-actionlib-msgs
	ros-melodic-actionlib
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-std-msgs
	ros-melodic-message-runtime
	ros-melodic-geometry-msgs
)

depends=(
	${ros_depends[@]}
)

_dir="common_tutorials-${pkgver}/turtle_actionlib"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/common_tutorials/archive/${pkgver}.tar.gz")
sha256sums=('e6015c289219df58253809254baa53dbf2f3190b61d77fac2b2fb8b8c12f3ec1')

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
