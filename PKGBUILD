# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - rqt_rviz provides a GUI plugin embedding RViz."
url='https://wiki.ros.org/rqt_rviz'

pkgname='ros-melodic-rqt-rviz'
pkgver='0.6.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
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
	boost
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
	boost
)

_dir="rqt_rviz-release-release-melodic-rqt_rviz-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rqt_rviz-release/archive/release/melodic/rqt_rviz/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('23e3aa89701e33665c95e1bd0f0df853a52a8bfd433c352071ba9ff597b8ecb7')

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
