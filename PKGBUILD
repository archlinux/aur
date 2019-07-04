# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - rqt_gui_cpp enables GUI plugins to use the C++ client library for ROS."
url='https://wiki.ros.org/rqt_gui_cpp'

pkgname='ros-melodic-rqt-gui-cpp'
pkgver='0.5.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-nodelet
	ros-melodic-catkin
	ros-melodic-qt-gui
	ros-melodic-roscpp
	ros-melodic-qt-gui-cpp
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	qt5-base
)

ros_depends=(
	ros-melodic-qt-gui
	ros-melodic-nodelet
	ros-melodic-qt-gui-cpp
	ros-melodic-roscpp
)

depends=(
	${ros_depends[@]}
)

_dir="rqt-release-release-melodic-rqt_gui_cpp-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rqt-release/archive/release/melodic/rqt_gui_cpp/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('29dd122311b73050bde2957210a6523688298a3c1993833b78ef18b80a671603')

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
