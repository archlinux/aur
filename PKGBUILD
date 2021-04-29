# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This is a set of tools for recording from and playing back to ROS topics."
url='https://wiki.ros.org/rosbag'

pkgname='ros-melodic-rosbag'
pkgver='1.14.11'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-std-srvs
	ros-melodic-xmlrpcpp
	ros-melodic-rosbag-storage
	ros-melodic-catkin
	ros-melodic-cpp-common
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-roscpp-serialization
	ros-melodic-topic-tools
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	python-pillow
	boost1.69
)

ros_depends=(
	ros-melodic-std-srvs
	ros-melodic-xmlrpcpp
	ros-melodic-rosbag-storage
	ros-melodic-genpy
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-topic-tools
	ros-melodic-rospy
	ros-melodic-genmsg
	ros-melodic-roslib
)

depends=(
	${ros_depends[@]}
	python-rospkg
	boost1.69
	python-gnupg
	python-crypto
)

_dir="ros_comm-${pkgver}/tools/rosbag"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/ros_comm/archive/${pkgver}.tar.gz")
sha256sums=('a7f3cf19059c189d3326d3e35f5795d707fa405fb55e7250353d71e0698410f5')

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
