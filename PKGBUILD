# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This package contains a class for converting from a 2D laser scan as defined by sensor_msgs/LaserScan into a point cloud as defined by sensor_msgs/PointCloud or sensor_msgs/PointCloud2."
url='https://wiki.ros.org/laser_geometry'

pkgname='ros-melodic-laser-geometry'
pkgver='1.6.7'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-melodic-angles
	ros-melodic-cmake-modules
	ros-melodic-catkin
	ros-melodic-tf
	ros-melodic-tf2
	ros-melodic-tf2-geometry-msgs
	ros-melodic-roscpp
	ros-melodic-sensor-msgs
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost1.69
	eigen
)

ros_depends=(
	ros-melodic-tf
	ros-melodic-tf2
	ros-melodic-angles
	ros-melodic-sensor-msgs
	ros-melodic-roscpp
)

depends=(
	${ros_depends[@]}
	boost1.69
	eigen
	python-numpy
)

_dir="laser_geometry-${pkgver}/"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/laser_geometry/archive/${pkgver}.tar.gz")
sha256sums=('334a1cb1e8846a80a9980f06e4ab01dedd15f85016ea9d7c6fa4f2a29b075760')

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
		 -DBOOST_ROOT=/opt/boost1.69 \
		 -DBoost_NO_SYSTEM_PATHS=TRUE
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
