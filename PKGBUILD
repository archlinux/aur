# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - tf2 is the second generation of the transform library, which lets the user keep track of multiple coordinate frames over time."
url='https://www.wiki.ros.org/tf2'

pkgname='ros-melodic-tf2'
pkgver='0.6.6'
arch=('any')
pkgrel=4
license=('BSD')

ros_makedepends=(
	ros-melodic-rostime
	ros-melodic-tf2-msgs
	ros-melodic-catkin
	ros-melodic-geometry-msgs
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	console-bridge
)

ros_depends=(
	ros-melodic-rostime
	ros-melodic-tf2-msgs
	ros-melodic-geometry-msgs
)

depends=(
	${ros_depends[@]}
	console-bridge
)

_dir="geometry2-${pkgver}/tf2"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/geometry2/archive/${pkgver}.tar.gz")
sha256sums=('4955f3ca30d194b0e0842f59b97a72d0e933908c20c56c8c374c152ab02568d1')

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
		-DBOOST_ROOT=/opt/boost1.69
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
