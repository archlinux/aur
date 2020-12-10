# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - rqt_rviz provides a GUI plugin embedding RViz."
url='https://wiki.ros.org/rqt_rviz'

pkgname='ros-melodic-rqt-rviz'
pkgver='0.6.0'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=4
license=('BSD')

ros_makedepends=(
	ros-melodic-rviz
	ros-melodic-rqt-gui-cpp
	ros-melodic-catkin
	ros-melodic-rqt-gui
	ros-melodic-pluginlib
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost1.69
	qt5-base
)

ros_depends=(
	ros-melodic-rqt-gui
	ros-melodic-rqt-gui-cpp
	ros-melodic-rviz
	ros-melodic-pluginlib
)

depends=(
	${ros_depends[@]}
	boost1.69
)

_dir="rqt_rviz-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/rqt_rviz/archive/${pkgver}.tar.gz")
sha256sums=('5007bf1c30ebe9e68e8ca3a4fa017f81671f1422e55a75b51aaf276ff74bfb0e')

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
