# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This package attempts to show the features of ROS python API step-by-step, including using messages, servers, parameters, etc."
url='https://www.wiki.ros.org/rospy_tutorials'

pkgname='ros-melodic-rospy-tutorials'
pkgver='0.9.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-message-generation
	ros-melodic-std-msgs
	ros-melodic-catkin
	ros-melodic-rostest
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-message-runtime
	ros-melodic-rospy
	ros-melodic-std-msgs
)

depends=(
	${ros_depends[@]}
)

_dir="ros_tutorials-${pkgver}/rospy_tutorials"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/ros_tutorials/archive/${pkgver}.tar.gz")
sha256sums=('403684ccddc5e62f4eba9058628d434a7ff07e0b0980fee43a44386f6d0c6d0a')

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
