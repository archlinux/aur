# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - A metapackage to aggregate the packages required to use publish / subscribe, services, launch files, and other core ROS concepts."
url='https://wiki.ros.org/ros_core'

pkgname='ros-melodic-ros-core'
pkgver='1.4.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=4
license=('BSD')

ros_makedepends=(
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-geneus
	ros-melodic-roscpp-core
	ros-melodic-std-srvs
	ros-melodic-gencpp
	ros-melodic-rosconsole-bridge
	ros-melodic-genmsg
	ros-melodic-rosbag-migration-rule
	ros-melodic-genlisp
	ros-melodic-message-generation
	ros-melodic-std-msgs
	ros-melodic-ros
	ros-melodic-roslisp
	ros-melodic-class-loader
	ros-melodic-genpy
	ros-melodic-cmake-modules
	ros-melodic-rospack
	ros-melodic-catkin
	ros-melodic-common-msgs
	ros-melodic-rosconsole
	ros-melodic-gennodejs
	ros-melodic-rosgraph-msgs
	ros-melodic-ros-comm
	ros-melodic-message-runtime
	ros-melodic-pluginlib
)

depends=(
	${ros_depends[@]}
)

_dir="metapackages-${pkgver}/ros_core"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/metapackages/archive/${pkgver}.tar.gz")
sha256sums=('ef1df96c61c9762555174cc1a0e21e05149f74909d27044be0cd10aa065747a1')

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
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
