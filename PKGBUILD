# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This package contains a C++ parser for the Unified Robot Description Format (URDF), which is an XML format for representing a robot model."
url='https://wiki.ros.org/urdf'

pkgname='ros-melodic-urdf'
pkgver='1.13.2'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-melodic-urdf-parser-plugin
	ros-melodic-cmake-modules
	ros-melodic-catkin
	ros-melodic-rosconsole-bridge
	ros-melodic-roscpp
	ros-melodic-pluginlib
	ros-melodic-rostest
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	tinyxml
	tinyxml2
	urdfdom
	urdfdom-headers
)

ros_depends=(
	ros-melodic-rosconsole-bridge
	ros-melodic-pluginlib
	ros-melodic-roscpp
)

depends=(
	${ros_depends[@]}
	tinyxml
	tinyxml2
	urdfdom
	urdfdom-headers
)

_dir="urdf-${pkgver}/urdf"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/urdf/archive/${pkgver}.tar.gz")
sha256sums=('6643846ea63504463ec0f2c5ba4c73d965455b5ecc7aed81b860b8b4c8fa7133')

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
