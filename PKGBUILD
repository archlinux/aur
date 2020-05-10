# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - roscpp is a C++ implementation of ROS."
url='https://github.com/ros/ros_comm'

pkgname='ros-noetic-roscpp'
pkgver='1.15.4'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-xmlrpcpp
	ros-noetic-roscpp-traits
	ros-noetic-catkin
	ros-noetic-rosgraph-msgs
	ros-noetic-message-generation
	ros-noetic-cpp-common
	ros-noetic-std-msgs
	ros-noetic-rosconsole
	ros-noetic-roscpp-serialization
	ros-noetic-rostime
	ros-noetic-roslang
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	pkg-config
)

ros_depends=(
	ros-noetic-rostime
	ros-noetic-xmlrpcpp
	ros-noetic-roscpp-traits
	ros-noetic-rosgraph-msgs
	ros-noetic-cpp-common
	ros-noetic-std-msgs
	ros-noetic-rosconsole
	ros-noetic-roscpp-serialization
	ros-noetic-message-runtime
)

depends=(
	${ros_depends[@]}
)

conflicts=(
	'ros-noetic-roscpp-git'
)

_dir="ros_comm-${pkgver}/clients/roscpp"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/ros_comm/archive/${pkgver}.tar.gz")
sha256sums=('d5c96a81e0c8554b77666bca5dcc68e03083a761a117038ff9b65f9643751c9e')

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

	# Create the build directory.
	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
	cd ${srcdir}/build

	#Workaround for boost signals
	sed -i 's/signals//g' ${srcdir}/${_dir}/CMakeLists.txt

	# Build the project.
	cmake ${srcdir}/${_dir} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCATKIN_BUILD_BINARY_PACKAGE=ON \
		-DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
		-DPYTHON_EXECUTABLE=/usr/bin/python3 \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
