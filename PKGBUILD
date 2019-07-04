# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - turtle_tf2 demonstrates how to write a tf2 broadcaster and listener with the turtlesim."
url='https://wiki.ros.org/turtle_tf2'

pkgname='ros-melodic-turtle-tf2'
pkgver='0.2.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-turtlesim
	ros-melodic-catkin
	ros-melodic-std-msgs
	ros-melodic-tf2-ros
	ros-melodic-roscpp
	ros-melodic-tf2
	ros-melodic-rospy
	ros-melodic-geometry-msgs
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-turtlesim
	ros-melodic-std-msgs
	ros-melodic-tf2-ros
	ros-melodic-roscpp
	ros-melodic-tf2
	ros-melodic-rospy
	ros-melodic-geometry-msgs
)

depends=(
	${ros_depends[@]}
)

_dir="geometry_tutorials-release-release-melodic-turtle_tf2-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/geometry_tutorials-release/archive/release/melodic/turtle_tf2/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('898be65b26bacc4c8ec117c9696b0506f18c33cce83c507442c3b4b239c64ada')

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
