# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - A Python GUI plugin for introspecting available ROS message types."
url='https://wiki.ros.org/rqt_msg'

pkgname='ros-melodic-rqt-msg'
pkgver='0.4.8'
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
	ros-melodic-rqt-py-common
	ros-melodic-rqt-gui-py
	ros-melodic-rosmsg
	ros-melodic-rqt-console
	ros-melodic-python-qt-binding
	ros-melodic-rqt-gui
	ros-melodic-rospy
	ros-melodic-roslib
)

depends=(
	${ros_depends[@]}
	python-rospkg
)

_dir="rqt_msg-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/rqt_msg/archive/${pkgver}.tar.gz")
sha256sums=('0f5a928077b9844b7aa558a80c9cc9171c5091868e58f6d0c02a1936c5d74757')

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
