# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This package contains a tool for setting and publishing joint state values for a given URDF."
url='https://www.wiki.ros.org/joint_state_publisher'

pkgname='ros-melodic-joint-state-publisher'
pkgver='1.12.15'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-melodic-catkin
	ros-melodic-rostest
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-python-qt-binding
	ros-melodic-sensor-msgs
	ros-melodic-rospy
)

depends=(
	${ros_depends[@]}
)

_dir="joint_state_publisher-${pkgver}/joint_state_publisher"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/joint_state_publisher/archive/${pkgver}.tar.gz")
sha256sums=('e125f65b45e99743016849d2cd6d73a5fbedc4b59beed7cd2bfa4b860dab8bba')

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
