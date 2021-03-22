# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This package contains the launch files that load the required
controller interfaces for simulation in Gazebo."
url='https://wiki.ros.org/summit_xl_control'

pkgname='ros-melodic-summit-xl-control'
pkgver='1.1.3'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
    ros-melodic-catkin
)

makedepends=(
    cmake
    ros-build-tools
	${ros_makedepends[@]}
)

ros_depends=(
    ros-melodic-robot-state-publisher
    ros-melodic-summit-xl-pad
    ros-melodic-twist-mux
)

depends=(
	${ros_depends[@]}
)

_dir="summit_xl_common-kinetic-${pkgver}/summit_xl_control"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/RobotnikAutomation/summit_xl_common/archive/kinetic-${pkgver}.tar.gz")
sha256sums=('8979bdda706b4cfd155df3f22aeecf56869e227113a9947f99f1dfee658d08fe')

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
