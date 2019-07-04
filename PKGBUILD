# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - ROS console output library."
url='https://wiki.ros.org/rosconsole'

pkgname='ros-melodic-rosconsole'
pkgver='1.13.10'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-rostime
	ros-melodic-cpp-common
	ros-melodic-rosunit
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	log4cxx
	apr
	boost
	apr-util
)

ros_depends=(
	ros-melodic-rostime
	ros-melodic-cpp-common
	ros-melodic-rosbuild
)

depends=(
	${ros_depends[@]}
	log4cxx
	apr
	apr-util
)

_dir="rosconsole-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/rosconsole/archive/${pkgver}.tar.gz")
sha256sums=('fc4376acac3c4b786fc362cb26e2d683e0687656f9cb7ad66d02464d3935e777')

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
