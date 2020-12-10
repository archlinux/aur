# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This package contains common nodelet tools such as a mux, demux and throttle."
url='https://wiki.ros.org/nodelet_topic_tools'

pkgname='ros-melodic-nodelet-topic-tools'
pkgver='1.9.16'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=4
license=('BSD')

ros_makedepends=(
	ros-melodic-dynamic-reconfigure
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost1.69
)

ros_depends=(
	ros-melodic-nodelet
	ros-melodic-dynamic-reconfigure
	ros-melodic-roscpp
	ros-melodic-message-filters
	ros-melodic-pluginlib
)

depends=(
	${ros_depends[@]}
	boost1.69
)

_dir="nodelet_core-${pkgver}/nodelet_topic_tools"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/nodelet_core/archive/${pkgver}.tar.gz")
sha256sums=('609a85323a47aff2e5e53531a465ddc62ba3290ba8b359a12dd07253bbaa9e26')

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
		 -DBOOST_ROOT=/opt/boost1.69
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
