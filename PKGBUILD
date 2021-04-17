# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="Gazebo plugin to provide simulated data from Velodyne laser scanners."
url='http://wiki.ros.org/velodyne_gazebo_plugins'

pkgname='ros-melodic-velodyne-gazebo-plugins'
pkgver='1.0.12'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-rospack
	ros-melodic-catkin
        ros-melodic-roscpp
        ros-melodic-sensor-msgs
        ros-melodic-tf
        ros-melodic-gazebo-ros
)

makedepends=(
	'cmake'
	'ros-build-tools'
        'git'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-ros-environment
	ros-melodic-rospack
	ros-melodic-catkin
        ros-melodic-roscpp
        ros-melodic-sensor-msgs
        ros-melodic-tf
        ros-melodic-gazebo-ros
)

depends=(
	${ros_depends[@]}
	python-rospkg
)

_dir=${pkgname}
_tag=${pkgver}
source=("${_dir}"::"git+https://bitbucket.org/DataspeedInc/velodyne_simulator.git"#tag=${_tag})
sha256sums=('SKIP')

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
	cmake ${srcdir}/${_dir}/velodyne_gazebo_plugins \
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
