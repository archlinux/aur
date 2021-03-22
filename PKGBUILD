# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - rqt_tf_tree provides a GUI plugin for visualizing the ROS TF frame tree."
url='https://wiki.ros.org/rqt_tf_tree'

pkgname='ros-melodic-rqt-tf-tree'
pkgver='0.6.0'
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
	ros-melodic-tf2
	ros-melodic-rqt-gui-py
	ros-melodic-rqt-graph
	ros-melodic-rqt-gui
	ros-melodic-tf2-ros
	ros-melodic-tf2-msgs
	ros-melodic-python-qt-binding
	ros-melodic-qt-dotgraph
	ros-melodic-rospy
	ros-melodic-geometry-msgs
)

depends=(
	${ros_depends[@]}
	python-rospkg
)

_dir="rqt_tf_tree-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/rqt_tf_tree/archive/${pkgver}.tar.gz")
sha256sums=('0d5996679310b747ac49d52c39e7869870458065b8ba118ed48b105d9f252604')

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
