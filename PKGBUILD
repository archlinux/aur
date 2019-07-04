# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - turtle_actionlib demonstrates how to write an action server and client with the turtlesim."
url='https://wiki.ros.org/turtle_actionlib'

pkgname='ros-melodic-turtle-actionlib'
pkgver='0.1.11'
_pkgver_patch=0
arch=('any')
pkgrel=1
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

_dir="common_tutorials-release-release-melodic-turtle_actionlib-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/common_tutorials-release/archive/release/melodic/turtle_actionlib/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('692d2a6946d45017346aa4165b4331314b1fde5f0067717ce33bf7ebbce1bc94')

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
		-DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
		-DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
		-DPYTHON_BASENAME=.cpython-37m \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
