# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - tf is a package that lets the user keep track of multiple coordinate frames over time."
url='https://github.com/ros/geometry'

pkgname='ros-melodic-tf'
pkgver='1.12.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-melodic-angles
	ros-melodic-rostime
	ros-melodic-catkin
	ros-melodic-message-generation
	ros-melodic-std-msgs
	ros-melodic-tf2-ros
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-message-filters
	ros-melodic-sensor-msgs
	ros-melodic-geometry-msgs
)

makedepends=(
	'cmake'
	'ros-build-tools'
        boost1.69
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-roswtf
	ros-melodic-message-runtime
	ros-melodic-std-msgs
	ros-melodic-tf2-ros
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-message-filters
	ros-melodic-sensor-msgs
	ros-melodic-geometry-msgs
)

depends=(
	${ros_depends[@]}
	graphviz
        boost1.69
)

_dir="geometry-${pkgver}/tf"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/geometry/archive/${pkgver}.tar.gz")
sha256sums=('6eacc9bb8e22d55263b1ab06f5c764a33c230084a0520a7d14ddcb6ed5d33f04')

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
