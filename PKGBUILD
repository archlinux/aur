# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - The pluginlib package provides tools for writing and dynamically loading plugins using the ROS build infrastructure."
url='http://www.ros.org/wiki/pluginlib'

pkgname='ros-melodic-pluginlib'
pkgver='1.12.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-melodic-class-loader
	ros-melodic-cmake-modules
	ros-melodic-catkin
	ros-melodic-rosconsole
	ros-melodic-roslib
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost1.69
	tinyxml2
)

ros_depends=(
	ros-melodic-class-loader
	ros-melodic-rosconsole
	ros-melodic-roslib
)

depends=(
	${ros_depends[@]}
	boost1.69
	tinyxml2
)

_dir="pluginlib-${pkgver}/pluginlib"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/pluginlib/archive/${pkgver}.tar.gz")
sha256sums=('28d63fe6de613e52876bdb9c2263f5ca982fe7dd6d40ed7976178801b9aaf9fb')

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
