# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - rqt_gui_cpp enables GUI plugins to use the C++ client library for ROS."
url='https://wiki.ros.org/rqt_gui_cpp'

pkgname='ros-noetic-rqt-gui-cpp'
pkgver='0.5.2'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-nodelet
	ros-noetic-catkin
	ros-noetic-qt-gui
	ros-noetic-roscpp
	ros-noetic-qt-gui-cpp
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	qt5-base
)

ros_depends=(
	ros-noetic-qt-gui
	ros-noetic-nodelet
	ros-noetic-qt-gui-cpp
	ros-noetic-roscpp
)

depends=(
	${ros_depends[@]}
)

_dir="rqt-${pkgver}/rqt_gui_cpp"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/rqt/archive/${pkgver}.tar.gz")
sha256sums=('9913fb6da15f0ccb9d995f8ea3be935d36bd255379c8ae19c0005207883299eb')

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

	# Create the build directory.
	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
	cd ${srcdir}/build

	# Build the project.
	cmake ${srcdir}/${_dir} \
		-DCATKIN_BUILD_BINARY_PACKAGE=ON \
		-DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
		-DPYTHON_EXECUTABLE=/usr/bin/python \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
