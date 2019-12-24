# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - 3D visualization tool for ROS."
url='https://wiki.ros.org/rviz'

pkgname='ros-melodic-rviz'
pkgver='1.13.7'
arch=('any')
pkgrel=1
license=('BSD, Creative Commons')

ros_makedepends=(
	ros-melodic-std-srvs
	ros-melodic-rosbag
	ros-melodic-tf
	ros-melodic-nav-msgs
	ros-melodic-urdf
	ros-melodic-python-qt-binding
	ros-melodic-resource-retriever
	ros-melodic-laser-geometry
	ros-melodic-std-msgs
	ros-melodic-interactive-markers
	ros-melodic-message-filters
	ros-melodic-rospy
	ros-melodic-roslib
	ros-melodic-image-transport
	ros-melodic-cmake-modules
	ros-melodic-catkin
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-visualization-msgs
	ros-melodic-sensor-msgs
	ros-melodic-map-msgs
	ros-melodic-pluginlib
	ros-melodic-geometry-msgs
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	yaml-cpp
	eigen3
	ogre-1.9
	assimp
	mesa
	tinyxml2
	urdfdom-headers
	qt5-base
        python2-pyqt5
        python2-sip-pyqt5
)

ros_depends=(
	ros-melodic-std-srvs
	ros-melodic-rosbag
	ros-melodic-tf
	ros-melodic-nav-msgs
	ros-melodic-urdf
	ros-melodic-python-qt-binding
	ros-melodic-resource-retriever
	ros-melodic-laser-geometry
	ros-melodic-media-export
	ros-melodic-std-msgs
	ros-melodic-interactive-markers
	ros-melodic-message-filters
	ros-melodic-rospy
	ros-melodic-roslib
	ros-melodic-image-transport
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-visualization-msgs
	ros-melodic-sensor-msgs
	ros-melodic-map-msgs
	ros-melodic-pluginlib
	ros-melodic-geometry-msgs
)

depends=(
	${ros_depends[@]}
	yaml-cpp
	eigen3
	ogre-1.9
	assimp
	mesa
	tinyxml2
	urdfdom-headers
	qt5-base
	sip
	python-sip
)

_dir="rviz-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/rviz/archive/${pkgver}.tar.gz")
sha256sums=('d02b797ddddb22844f6d37b19112959774867da95b58ac4a09169747e0c42152')

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

	# Fixes OGRE Path issue
	PKG_CONFIG_PATH=/opt/OGRE-1.9/lib/pkgconfig:$PKG_CONFIG_PATH

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
