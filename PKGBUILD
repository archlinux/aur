# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - The actionlib stack provides a standardized interface for interfacing with preemptable tasks."
url='https://wiki.ros.org/actionlib'

pkgname='ros-melodic-actionlib'
pkgver='1.12.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=5
license=('BSD')

ros_makedepends=(
	ros-melodic-rostest
	ros-melodic-catkin
	ros-melodic-message-generation
	ros-melodic-actionlib-msgs
	ros-melodic-std-msgs
	ros-melodic-roscpp
	ros-melodic-rospy
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost1.69
)

ros_depends=(
	ros-melodic-rostest
	ros-melodic-actionlib-msgs
	ros-melodic-rostopic
	ros-melodic-std-msgs
	ros-melodic-roscpp
	ros-melodic-message-runtime
	ros-melodic-rospy
	ros-melodic-roslib
)

depends=(
	${ros_depends[@]}
	python-wxpython
	boost1.69
)

_dir="actionlib-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/actionlib/archive/${pkgver}.tar.gz")
sha256sums=('b98852a6cdd6947200a1d985d4041c0d9c28fe0d789284edc561f85486a792d0')

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
