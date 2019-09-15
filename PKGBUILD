# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - rqt_common_plugins metapackage provides ROS backend graphical tools suite that can be used on/off of robot runtime."
url='https://wiki.ros.org/rqt_common_plugins'

pkgname='ros-melodic-rqt-common-plugins'
pkgver='0.4.8'
_pkgver_patch=0
arch=('any')
pkgrel=2
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
	ros-melodic-rqt-bag-plugins
	ros-melodic-rqt-launch
	ros-melodic-rqt-action
	ros-melodic-rqt-msg
	ros-melodic-rqt-logger-level
	ros-melodic-rqt-top
	ros-melodic-rqt-service-caller
	ros-melodic-rqt-shell
	ros-melodic-rqt-graph
	ros-melodic-rqt-topic
	ros-melodic-rqt-web
	ros-melodic-rqt-py-common
	ros-melodic-rqt-bag
	ros-melodic-rqt-plot
	ros-melodic-rqt-publisher
	ros-melodic-rqt-console
	ros-melodic-rqt-srv
	ros-melodic-rqt-dep
	ros-melodic-rqt-image-view
	ros-melodic-rqt-py-console
	ros-melodic-rqt-reconfigure
)

depends=(
	${ros_depends[@]}
)

_dir="rqt_common_plugins-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/rqt_common_plugins/archive/${pkgver}.tar.gz")
sha256sums=('73cba40630e4bb41f1fa2960d5b03925e878ee90ea59bd5117961c231bea9819')

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
