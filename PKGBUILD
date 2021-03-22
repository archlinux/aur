# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - The summit_xl_localization package"
url='https://wiki.ros.org/summit_xl_localization'

pkgname='ros-melodic-summit-xl-localization'
pkgver='1.1.3'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
    ros-melodic-catkin
    ros-melodic-roscpp
    ros-melodic-std-msgs
    ros-melodic-std-srvs
    ros-melodic-robot-localization
    ros-melodic-geographic-msgs
    ros-melodic-geometry-msgs
    ros-melodic-nav-msgs
    ros-melodic-message-filters
    ros-melodic-sensor-msgs
    ros-melodic-tf2
    ros-melodic-tf
    ros-melodic-tf2-ros
    ros-melodic-tf2-geometry-msgs
    ros-melodic-robotnik-msgs
    ros-melodic-mavros-msgs
    ros-melodic-gmapping
    ros-melodic-amcl
    ros-melodic-map-server
)

makedepends=(
    cmake
    ros-build-tools
	${ros_makedepends[@]}
    eigen
)

ros_depends=(
    ros-melodic-roscpp
    ros-melodic-std-msgs
    ros-melodic-std-srvs
    ros-melodic-geographic-msgs
    ros-melodic-geometry-msgs
    ros-melodic-robot-localization
    ros-melodic-nav-msgs
    ros-melodic-sensor-msgs
    ros-melodic-tf2
    ros-melodic-tf
    ros-melodic-tf2-ros
    ros-melodic-tf2-geometry-msgs
    ros-melodic-message-filters
    ros-melodic-message-runtime
    ros-melodic-robotnik-msgs
    ros-melodic-mavros-msgs
    ros-melodic-gmapping
    ros-melodic-amcl
    ros-melodic-map-server
)

depends=(
	${ros_depends[@]}
)

_dir="summit_xl_common-kinetic-${pkgver}/summit_xl_localization"
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
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
