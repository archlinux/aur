# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - rqt_robot_monitor displays diagnostics_agg topics messages that are published by diagnostic_aggregator."
url='https://wiki.ros.org/rqt_robot_monitor'

pkgname='ros-melodic-rqt-robot-monitor'
pkgver='0.5.9'
_pkgver_patch=0
arch=('any')
pkgrel=1
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
	ros-melodic-diagnostic-msgs
	ros-melodic-qt-gui-py-common
	ros-melodic-rqt-gui
	ros-melodic-qt-gui
	ros-melodic-rqt-bag
	ros-melodic-python-qt-binding
	ros-melodic-rqt-py-common
	ros-melodic-rospy
)

depends=(
	${ros_depends[@]}
	python-rospkg
)

_dir="rqt_robot_monitor-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/rqt_robot_monitor/archive/${pkgver}.tar.gz")
sha256sums=('11718ae155fb6c60f964b3d9e9616a3b4d1d6fdf9c9732e736ff864ed44c0961')

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
