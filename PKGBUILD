# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This package contains a class for converting from a 2D laser scan as defined by sensor_msgs/LaserScan into a point cloud as defined by sensor_msgs/PointCloud or sensor_msgs/PointCloud2."
url='https://wiki.ros.org/laser_geometry'

pkgname='ros-noetic-laser-geometry'
pkgver='1.6.4'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-noetic-angles
	ros-noetic-cmake-modules
	ros-noetic-catkin
	ros-noetic-tf
	ros-noetic-roscpp
	ros-noetic-sensor-msgs
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost
	eigen3
)

ros_depends=(
	ros-noetic-tf
	ros-noetic-angles
	ros-noetic-sensor-msgs
	ros-noetic-roscpp
)

depends=(
	${ros_depends[@]}
	boost
	eigen3
	python-numpy
)

_dir="laser_geometry-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/laser_geometry/archive/${pkgver}.tar.gz")
sha256sums=('8daf8b8b571ca915d8ccbe517af5e6e69a2083a663c5ba4e89a29aa92a58abdb')

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
