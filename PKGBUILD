# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Assorted filters designed to operate on 2D planar laser scanners, which use the sensor_msgs/LaserScan type."
url='https://wiki.ros.org/laser_filters'

pkgname='ros-melodic-laser-filters'
pkgver='1.8.11'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=4
license=('BSD')

ros_makedepends=(
	ros-melodic-dynamic-reconfigure
	ros-melodic-filters
	ros-melodic-laser-geometry
	ros-melodic-angles
	ros-melodic-rostest
	ros-melodic-catkin
	ros-melodic-tf
	ros-melodic-roscpp
	ros-melodic-message-filters
	ros-melodic-sensor-msgs
	ros-melodic-pluginlib
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
        boost1.69
)

ros_depends=(
	ros-melodic-dynamic-reconfigure
	ros-melodic-filters
	ros-melodic-laser-geometry
	ros-melodic-angles
	ros-melodic-tf
	ros-melodic-roscpp
	ros-melodic-message-filters
	ros-melodic-sensor-msgs
	ros-melodic-pluginlib
)

depends=(
	${ros_depends[@]}
        boost1.69
)

_dir="laser_filters-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/laser_filters/archive/${pkgver}.tar.gz")
sha256sums=('8c81c29f6e48daa6c120ddc72088b7a84d9753f91cb5027e745b0a94f9fd41fb')

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
