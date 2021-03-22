# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Robotnik standard sensors description. URDF and meshes."
url='https://wiki.ros.org/robotnik_sensors'

pkgname='ros-melodic-robotnik-sensors'
pkgver='1.1.2'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
    ros-melodic-catkin
    ros-melodic-urdf
    ros-melodic-xacro
)

makedepends=(
	${ros_makedepends[@]}
)

ros_depends=(
    ros-melodic-urdf
    ros-melodic-xacro
    ros-melodic-hector-gazebo-plugins
    ros-melodic-gazebo-plugins
)

depends=(
	${ros_depends[@]}
)

_dir="robotnik_sensors-kinetic-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/RobotnikAutomation/robotnik_sensors/archive/kinetic-${pkgver}.tar.gz")
sha256sums=('ed93fb5c5a46b805cbfc9e930a95d26f5311411e4018dce76cdac291435f21fb')

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
		-DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
		-DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
		-DPYTHON_BASENAME=.cpython-37m \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
