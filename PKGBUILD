# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - turtle_tf2 demonstrates how to write a tf2 broadcaster and listener with the turtlesim."
url='https://wiki.ros.org/turtle_tf2'

pkgname='ros-melodic-turtle-tf2'
pkgver='0.2.2'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=4
license=('BSD')

ros_makedepends=(
	ros-melodic-turtlesim
	ros-melodic-catkin
	ros-melodic-std-msgs
	ros-melodic-tf2-ros
	ros-melodic-roscpp
	ros-melodic-tf2
	ros-melodic-rospy
	ros-melodic-geometry-msgs
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-turtlesim
	ros-melodic-std-msgs
	ros-melodic-tf2-ros
	ros-melodic-roscpp
	ros-melodic-tf2
	ros-melodic-rospy
	ros-melodic-geometry-msgs
)

depends=(
	${ros_depends[@]}
)

_dir="geometry_tutorials-${pkgver}/turtle_tf2"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/geometry_tutorials/archive/${pkgver}.tar.gz")
sha256sums=('4b3fdc98bf4cb97ba2f1c40666901fa7d08eb3dfed0d3323de4841de2e3a22cc')

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
