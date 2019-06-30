# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This package contains the ROS bindings for the tf2 library, for both Python and C++."
url='http://wiki.ros.org/tf2_ros'

pkgname='ros-melodic-tf2-ros'
pkgver='0.6.5'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-tf2
	ros-melodic-xmlrpcpp
	ros-melodic-tf2-py
	ros-melodic-catkin
	ros-melodic-actionlib-msgs
	ros-melodic-actionlib
	ros-melodic-std-msgs
	ros-melodic-roscpp
	ros-melodic-rosgraph
	ros-melodic-message-filters
	ros-melodic-tf2-msgs
	ros-melodic-rospy
	ros-melodic-geometry-msgs
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-tf2
	ros-melodic-xmlrpcpp
	ros-melodic-tf2-py
	ros-melodic-actionlib-msgs
	ros-melodic-actionlib
	ros-melodic-std-msgs
	ros-melodic-roscpp
	ros-melodic-rosgraph
	ros-melodic-message-filters
	ros-melodic-tf2-msgs
	ros-melodic-rospy
	ros-melodic-geometry-msgs
)

depends=(
	${ros_depends[@]}
)

_dir="geometry2-release-release-melodic-tf2_ros-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/geometry2-release/archive/release/melodic/tf2_ros/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('f5ea730b28e1668228c151fec493a768164843aa867770570c93ba3dcbda2d0f')

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
