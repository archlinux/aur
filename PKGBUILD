# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Package containing messages for communicating with rotary wing
MAVs"
url='https://wiki.ros.org/mav_msgs'

pkgname='ros-melodic-mav-msgs'
pkgver='3.3.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('ASL 2.0')

ros_makedepends=(
    ros-melodic-catkin
    ros-melodic-cmake-modules
    ros-melodic-geometry-msgs
    ros-melodic-message-generation
    ros-melodic-std-msgs
    ros-melodic-trajectory-msgs
)

makedepends=(
    cmake
    ros-build-tools
	${ros_makedepends[@]}
    eigen
)

ros_depends=(
    ros-melodic-geometry-msgs
    ros-melodic-message-generation
    ros-melodic-std-msgs
    ros-melodic-trajectory-msgs
)

depends=(
	${ros_depends[@]}
    eigen
)

_dir="mav_comm-${pkgver}/mav_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ethz-asl/mav_comm/archive/${pkgver}.tar.gz")
sha256sums=('5c24fd711d32a024d226707aca6e18ed31e5ebd01e5bfe725098d07619223459')

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
