# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - hector_gazebo_plugins provides gazebo plugins from Team Hector."
url='https://wiki.ros.org/hector_gazebo_plugins'

pkgname='ros-melodic-hector-gazebo-plugins'
pkgver='0.5.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
    ros-melodic-catkin
    ros-melodic-roscpp
    ros-melodic-gazebo-dev
    ros-melodic-std-msgs
    ros-melodic-std-srvs
    ros-melodic-geometry-msgs
    ros-melodic-nav-msgs
    ros-melodic-tf
    ros-melodic-dynamic-reconfigure
    ros-melodic-message-generation
)

makedepends=(
    cmake
    ros-build-tools
	${ros_makedepends[@]}
)

ros_depends=(
    ros-melodic-roscpp
    ros-melodic-gazebo-ros
    ros-melodic-std-msgs
    ros-melodic-std-srvs
    ros-melodic-geometry-msgs
    ros-melodic-nav-msgs
    ros-melodic-tf
    ros-melodic-dynamic-reconfigure
    ros-melodic-message-runtime
)

depends=(
	${ros_depends[@]}
    gazebo
)

_dir="hector_gazebo-${pkgver}/hector_gazebo_plugins"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/tu-darmstadt-ros-pkg/hector_gazebo/archive/${pkgver}.tar.gz")
sha256sums=('c99d1e4b95360f0544fed91ca51ae469c09fefcdb10a7adfde002a94cda8531b')

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
