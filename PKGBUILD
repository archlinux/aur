# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - ROS communications-related packages, including core client libraries (roscpp, rospy) and graph introspection tools (rostopic, rosnode, rosservice, rosparam)."
url='http://www.ros.org/wiki/ros_comm'

pkgname='ros-melodic-ros-comm'
pkgver='1.14.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-std-srvs
	ros-melodic-rosbag
	ros-melodic-rosmsg
	ros-melodic-rosout
	ros-melodic-rosparam
	ros-melodic-topic-tools
	ros-melodic-rosgraph
	ros-melodic-message-filters
	ros-melodic-rospy
	ros-melodic-ros
	ros-melodic-roslisp
	ros-melodic-roswtf
	ros-melodic-rosmaster
	ros-melodic-rostopic
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-xmlrpcpp
	ros-melodic-rostest
	ros-melodic-rosnode
	ros-melodic-rosgraph-msgs
	ros-melodic-roslaunch
	ros-melodic-rosservice
)

depends=(
	${ros_depends[@]}
)

_dir="ros_comm-release-release-melodic-ros_comm"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_comm-release/archive/release/melodic/ros_comm/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('e03aa0bf1d845d33a2a5d9e473ea7d6ddb2b9e0190c9ca98d12e9848560bdff6')

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
