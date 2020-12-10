# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This unary stack contains the dynamic_reconfigure package which provides a means to change node parameters at any time without having to restart the node."
url='https://wiki.ros.org/dynamic_reconfigure'

pkgname='ros-melodic-dynamic-reconfigure'
pkgver='1.6.3'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-melodic-rostest
	ros-melodic-catkin
	ros-melodic-message-generation
	ros-melodic-cpp-common
	ros-melodic-std-msgs
	ros-melodic-roscpp
	ros-melodic-roscpp-serialization
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost1.69
)

ros_depends=(
	ros-melodic-rosservice
	ros-melodic-std-msgs
	ros-melodic-roscpp
	ros-melodic-message-runtime
	ros-melodic-rospy
	ros-melodic-roslib
)

depends=(
	${ros_depends[@]}
	boost1.69
)

_dir="dynamic_reconfigure-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/dynamic_reconfigure/archive/${pkgver}.tar.gz")
sha256sums=('2916e14caabe367f9260b18d9c7914516a5c18a7bc6305b6b60c74ddd1c3a919')

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
		-DSETUPTOOLS_DEB_LAYOUT=OFF \
		 -DBOOST_ROOT=/opt/boost1.69
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
