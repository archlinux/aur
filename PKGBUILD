# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - rqt_bag provides a GUI plugin for displaying and replaying ROS bag files."
url='https://wiki.ros.org/rqt_bag'

pkgname='ros-melodic-rqt-bag'
pkgver='0.5.1'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-rqt-gui-py
	ros-melodic-rosbag
	ros-melodic-rosnode
	ros-melodic-rosgraph-msgs
	ros-melodic-python-qt-binding
	ros-melodic-rqt-gui
	ros-melodic-rospy
	ros-melodic-roslib
)

depends=(
	${ros_depends[@]}
	python-rospkg
)

_dir="rqt_bag-${pkgver}/rqt_bag"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/rqt_bag/archive/${pkgver}.tar.gz")
sha256sums=('52c194b9bdfc63b03b88fdb9d851715ba456a9fc016cf22c8f9cbf0c0bc9ecf9')

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
