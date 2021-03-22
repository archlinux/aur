# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - The rotors_gazebo_plugins package"
url='https://wiki.ros.org/rotors_gazebo_plugins'

pkgname='ros-melodic-rotors-gazebo-plugins'
pkgver='2.2.3'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('ASL 2.0')

ros_makedepends=(
    ros-melodic-catkin
    ros-melodic-cmake-modules
    ros-melodic-cv-bridge
    ros-melodic-gazebo-plugins
    ros-melodic-gazebo-ros
    ros-melodic-geometry-msgs
    ros-melodic-mavros
    ros-melodic-mav-msgs
    ros-melodic-octomap-msgs
    ros-melodic-octomap-ros
    ros-melodic-octomap
    ros-melodic-rosbag
    ros-melodic-roscpp
    ros-melodic-rotors-comm
    ros-melodic-rotors-control
    ros-melodic-std-srvs
    ros-melodic-tf
)

makedepends=(
    cmake
    ros-build-tools
	${ros_makedepends[@]}
    gazebo
    google-glog
    protobuf
    yaml-cpp
)

ros_depends=(
)

depends=(
	${ros_depends[@]}
)

_dir="rotors_simulator-${pkgver}/rotors_gazebo_plugins"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ethz-asl/rotors_simulator/archive/${pkgver}.tar.gz")
sha256sums=('46e6be40ebd08ba41a4a532c1774228d240d11aa39ad82f9ab50e445dc4a6f20')

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
