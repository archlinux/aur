# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - roscpp is a C++ implementation of ROS."
url='http://ros.org/wiki/roscpp'

pkgname='ros-melodic-roscpp'
pkgver='1.14.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-xmlrpcpp
	ros-melodic-roscpp-traits
	ros-melodic-catkin
	ros-melodic-rosgraph-msgs
	ros-melodic-message-generation
	ros-melodic-cpp-common
	ros-melodic-std-msgs
	ros-melodic-rosconsole
	ros-melodic-roscpp-serialization
	ros-melodic-rostime
	ros-melodic-roslang
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	pkg-config
)

ros_depends=(
	ros-melodic-rostime
	ros-melodic-xmlrpcpp
	ros-melodic-roscpp-traits
	ros-melodic-rosgraph-msgs
	ros-melodic-cpp-common
	ros-melodic-std-msgs
	ros-melodic-rosconsole
	ros-melodic-roscpp-serialization
	ros-melodic-message-runtime
)

depends=(
	${ros_depends[@]}
)

_dir="ros_comm-release-release-melodic-roscpp-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_comm-release/archive/release/melodic/roscpp/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('aafa1e50ff61f428b3cdf7158129b8b09b4bd7aae6aee553f6a5c8251eae1806')

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
