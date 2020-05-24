# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Common service definitions."
url='https://wiki.ros.org/std_srvs'

pkgname='ros-noetic-std-srvs'
pkgver='1.11.2'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-noetic-message-generation
	ros-noetic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-message-runtime
)

depends=(
	${ros_depends[@]}
)

_dir="ros_comm_msgs-${pkgver}/std_srvs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/ros_comm_msgs/archive/${pkgver}.tar.gz")
sha256sums=('7bb9f57ea9e6c5fb0599b247736f4f3b7868d722344fb42bc3055b31626ea250')

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
