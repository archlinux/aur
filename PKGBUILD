# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - 3D visualization tool for ROS."
url='http://ros.org/wiki/rviz'

pkgname='ros-melodic-rviz'
pkgver='1.13.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD, Creative Commons')

ros_makedepends=(
	ros-melodic-cmake-modules
	ros-melodic-rospy
	ros-melodic-roscpp
	ros-melodic-map-msgs
	ros-melodic-interactive-markers
	ros-melodic-std-srvs
	ros-melodic-catkin
	ros-melodic-geometry-msgs
	ros-melodic-urdf
	ros-melodic-rosbag
	ros-melodic-roslib
	ros-melodic-rosconsole
	ros-melodic-nav-msgs
	ros-melodic-image-transport
	ros-melodic-tf
	ros-melodic-laser-geometry
	ros-melodic-resource-retriever
	ros-melodic-std-msgs
	ros-melodic-sensor-msgs
	ros-melodic-message-filters
	ros-melodic-visualization-msgs
	ros-melodic-pluginlib
	ros-melodic-python-qt-binding
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	yaml-cpp
	mesa
	qt5-base
	urdfdom-headers
	assimp
	ogre-1.9
	eigen3
	tinyxml2
)

ros_depends=(
	ros-melodic-rospy
	ros-melodic-roscpp
	ros-melodic-map-msgs
	ros-melodic-interactive-markers
	ros-melodic-std-srvs
	ros-melodic-geometry-msgs
	ros-melodic-urdf
	ros-melodic-rosbag
	ros-melodic-roslib
	ros-melodic-rosconsole
	ros-melodic-nav-msgs
	ros-melodic-image-transport
	ros-melodic-tf
	ros-melodic-laser-geometry
	ros-melodic-resource-retriever
	ros-melodic-std-msgs
	ros-melodic-sensor-msgs
	ros-melodic-message-filters
	ros-melodic-visualization-msgs
	ros-melodic-pluginlib
	ros-melodic-media-export
	ros-melodic-python-qt-binding
)

depends=(
	${ros_depends[@]}
	yaml-cpp
	mesa
	qt5-base
	urdfdom-headers
	assimp
	ogre-1.9
	eigen3
	tinyxml2
)

_dir=${pkgname}
source=("${_dir}"::"git+https://github.com/ros-gbp/rviz-release.git")
sha256sums=('SKIP')

prepare() {
	cd ${srcdir}/${_dir}
	git checkout upstream
	_pkgname=$(echo ${pkgname} | sed 's/ros-lunar-//' | sed 's/-/_/g')

	if [ -d ${_pkgname} ]; then
		git subtree split -P ${_pkgname} --branch ${_pkgname}
		git checkout ${_pkgname}
	fi
}

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
