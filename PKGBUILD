# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - control_msgs contains base messages and actions useful for controlling robots."
url='https://wiki.ros.org/control_msgs'

pkgname='ros-melodic-control-msgs'
pkgver='1.5.1'
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-melodic-trajectory-msgs
	ros-melodic-catkin
	ros-melodic-message-generation
	ros-melodic-std-msgs
	ros-melodic-actionlib-msgs
	ros-melodic-geometry-msgs
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-trajectory-msgs
	ros-melodic-std-msgs
	ros-melodic-actionlib-msgs
	ros-melodic-message-runtime
	ros-melodic-geometry-msgs
)

depends=(
	${ros_depends[@]}
)

_dir="control_msgs-${pkgver}/control_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-controls/control_msgs/archive/${pkgver}.tar.gz")
sha256sums=('fb16f5748963616099e9b8f92a36ee8a57240dc80e3a7b74e45499ebb9825887')

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
