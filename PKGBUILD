# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - rqt_plot provides a GUI plugin visualizing numeric values in a 2D plot using different plotting backends."
url='https://wiki.ros.org/rqt_plot'

pkgname='ros-noetic-rqt-plot'
pkgver='0.4.9'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-rqt-py-common
	ros-noetic-rqt-gui-py
	ros-noetic-qwt-dependency
	ros-noetic-qt-gui-py-common
	ros-noetic-std-msgs
	ros-noetic-rostopic
	ros-noetic-rosgraph
	ros-noetic-python-qt-binding
	ros-noetic-rqt-gui
)

depends=(
	${ros_depends[@]}
	python-rospkg
	python-matplotlib
	python-numpy
)

_dir="rqt_plot-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/rqt_plot/archive/${pkgver}.tar.gz")
sha256sums=('f133af1febcb43d82214508a3a6eb51fdf848fe5353f3c6c7f5825cea3f84ead')

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

	# Create the build directory.
	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
	cd ${srcdir}/build

	# Build the project.
	cmake ${srcdir}/${_dir} \
		-DCATKIN_BUILD_BINARY_PACKAGE=ON \
		-DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
		-DPYTHON_EXECUTABLE=/usr/bin/python \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
