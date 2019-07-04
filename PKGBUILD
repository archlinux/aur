# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - ROS Package Tool."
url='https://wiki.ros.org/rospack'

pkgname='ros-melodic-rospack'
pkgver='2.5.3'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-cmake-modules
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	tinyxml2
	gtest
	pkg-config
	boost
	python
)

ros_depends=(
	ros-melodic-ros-environment
)

depends=(
	${ros_depends[@]}
	tinyxml2
	python-rosdep
	python-catkin_pkg
	pkg-config
	boost
	python
)

_dir="rospack-${pkgver}"
source=("${_dir}.tar.gz"::"https://github.com/ros/rospack/archive/${pkgver}.tar.gz")
sha256sums=('6d3def4e56d351baab049550b41d4b452da3fa262ba1e2fdc8ec8173ebe0eebd')

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
