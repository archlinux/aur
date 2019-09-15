# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This rqt plugin ROS package provides easy view of .launch files."
url='https://wiki.ros.org/rqt_launch'

pkgname='ros-melodic-rqt-launch'
pkgver='0.4.8'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-melodic-rqt-py-common
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
	ros-melodic-rqt-console
	ros-melodic-roslaunch
	ros-melodic-python-qt-binding
	ros-melodic-rqt-gui
	ros-melodic-rospy
)

depends=(
	${ros_depends[@]}
)

_dir="rqt_launch-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/rqt_launch/archive/${pkgver}.tar.gz")
sha256sums=('6c3fcde64a2a4458a010ec5dbd7217cf61170ff3a90529ba0d000f43437c2c54')

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
