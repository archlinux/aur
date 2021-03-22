# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - A Python and C++ implementation of the LZ4 streaming format."
url='https://wiki.ros.org/roslz4'

pkgname='ros-melodic-roslz4'
pkgver='1.14.10'
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-melodic-catkin
	ros-melodic-cpp-common
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	lz4
)

ros_depends=(
)

depends=(
	${ros_depends[@]}
	lz4
)

_dir="ros_comm-${pkgver}/utilities/roslz4"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/ros_comm/archive/${pkgver}.tar.gz")
sha256sums=('b3b75612feb447afe70600e3ba80bf3e356493a058ba8ebf2746e8db0c55165c')

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
		-DPYTHON_INCLUDE_DIR=/usr/include/python3.9 \
		-DPYTHON_LIBRARY=/usr/lib/libpython3.9.so \
		-DPYTHON_BASENAME=.cpython-38 \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
