# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - The smach_ros package contains extensions for the SMACH library to integrate it tightly with ROS."
url='https://wiki.ros.org/smach_ros'

pkgname='ros-melodic-smach-ros'
pkgver='2.0.1'
_pkgver_patch=0
arch=('any')
pkgrel=3
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
	ros-melodic-std-srvs
	ros-melodic-smach-msgs
	ros-melodic-std-msgs
	ros-melodic-rostopic
	ros-melodic-actionlib
	ros-melodic-actionlib-msgs
	ros-melodic-smach
	ros-melodic-rospy
)

depends=(
	${ros_depends[@]}
)

_dir="executive_smach-${pkgver}/smach_ros"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/executive_smach/archive/${pkgver}.tar.gz")
sha256sums=('2f7f58064c960fc56de15fdedfd883f62122bd44874787f13c8b4d8a77c45380')

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
