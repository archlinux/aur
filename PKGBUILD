# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - 3D interactive marker communication library for RViz and similar tools."
url='https://wiki.ros.org/interactive_markers'

pkgname='ros-melodic-interactive-markers'
pkgver='1.11.4'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-melodic-rostest
	ros-melodic-catkin
	ros-melodic-tf
	ros-melodic-std-msgs
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-visualization-msgs
	ros-melodic-rospy
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-rostest
	ros-melodic-tf
	ros-melodic-std-msgs
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-visualization-msgs
	ros-melodic-rospy
)

depends=(
	${ros_depends[@]}
)

_dir="interactive_markers-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/interactive_markers/archive/${pkgver}.tar.gz")
sha256sums=('33319252510cae10a8a2e2af5ac104f33ebb0b2f5ae8d9ab9649b5dc9ee34a7a')

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
