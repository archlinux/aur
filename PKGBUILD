# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - The class_loader package is a ROS-independent package for loading plugins during runtime and the foundation of the higher level ROS pluginlib library."
url='https://wiki.ros.org/class_loader'

pkgname='ros-melodic-class-loader'
pkgver='0.4.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-melodic-cmake-modules
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost1.69
	console-bridge
	poco
)

ros_depends=(
)

depends=(
	${ros_depends[@]}
	boost1.69
	console-bridge
	poco
)

_dir="class_loader-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/class_loader/archive/${pkgver}.tar.gz")
sha256sums=('3f31c9acb3c2b8e72b32bfae23f11abd7e0329789857e3833d300194a2e73961')

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
