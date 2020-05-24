# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - A metapackage to aggregate the packages required to use publish / subscribe, services, launch files, and other core ROS concepts."
url='https://wiki.ros.org/ros_core'

pkgname='ros-noetic-ros-core'
pkgver='1.4.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-geneus
	ros-noetic-roscpp-core
	ros-noetic-std-srvs
	ros-noetic-gencpp
	ros-noetic-rosconsole-bridge
	ros-noetic-genmsg
	ros-noetic-rosbag-migration-rule
	ros-noetic-genlisp
	ros-noetic-message-generation
	ros-noetic-std-msgs
	ros-noetic-ros
	ros-noetic-roslisp
	ros-noetic-class-loader
	ros-noetic-genpy
	ros-noetic-cmake-modules
	ros-noetic-rospack
	ros-noetic-catkin
	ros-noetic-common-msgs
	ros-noetic-rosconsole
	ros-noetic-gennodejs
	ros-noetic-rosgraph-msgs
	ros-noetic-ros-comm
	ros-noetic-message-runtime
	ros-noetic-pluginlib
)

depends=(
	${ros_depends[@]}
)

_dir="metapackages-${pkgver}/ros_core"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/metapackages/archive/${pkgver}.tar.gz"
        "https://patch-diff.githubusercontent.com/raw/ros/metapackages/pull/31.patch")
sha256sums=('ef1df96c61c9762555174cc1a0e21e05149f74909d27044be0cd10aa065747a1'
            'a8648852cff7b2740c5fe523b78309557b7f58e5c010e71a94c341b8cbfd5ba2')

prepare() {
    cd ${srcdir}/${_dir}/..
    patch -p1 < ${srcdir}/31.patch
}

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

	# Create the build directory.
	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
	cd ${srcdir}/build

	# Build the project.
	cmake ${srcdir}/${_dir} \
		-DCATKIN_BUILD_BINARY_PACKAGE=ON \
		-DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
		-DPYTHON_EXECUTABLE=/usr/bin/python \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
