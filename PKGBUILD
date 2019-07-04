# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - 3D interactive marker communication library for RViz and similar tools."
url='https://wiki.ros.org/interactive_markers'

pkgname='ros-melodic-interactive-markers'
pkgver='1.11.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-rostest
	ros-melodic-catkin
	ros-melodic-tf
	ros-melodic-std-msgs
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-visualization-msgs
	ros-melodic-rospy
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-rostest
	ros-melodic-tf
	ros-melodic-std-msgs
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-visualization-msgs
	ros-melodic-rospy
)

depends=(
	${ros_depends[@]}
)

_dir="interactive_markers-release-release-melodic-interactive_markers-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/interactive_markers-release/archive/release/melodic/interactive_markers/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('600001c06acb4e88fe5c9f512476d50b41a795356643bb02e528748b158b81f8')

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
