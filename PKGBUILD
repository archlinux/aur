# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS -  Contains a node that rotates an image stream in a way that minimizes the angle between a vector in some arbitrary frame and a vector in the camera frame."
url='https://wiki.ros.org/image_rotate'

pkgname='ros-melodic-image-rotate'
pkgver='1.15.0'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-melodic-tf2-geometry-msgs
	ros-melodic-nodelet
	ros-melodic-geometry-msgs
	ros-melodic-dynamic-reconfigure
	ros-melodic-cmake-modules
	ros-melodic-catkin
	ros-melodic-cv-bridge
	ros-melodic-tf2-ros
	ros-melodic-roscpp
	ros-melodic-tf2
	ros-melodic-image-transport
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-tf2-geometry-msgs
	ros-melodic-nodelet
	ros-melodic-dynamic-reconfigure
	ros-melodic-cv-bridge
	ros-melodic-tf2-ros
	ros-melodic-roscpp
	ros-melodic-tf2
	ros-melodic-image-transport
)

depends=(
	${ros_depends[@]}
)

_dir="image_pipeline-melodic-${pkgver}/image_rotate"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/image_pipeline/archive/melodic-${pkgver}.tar.gz")
sha256sums=('453ab2347197614806c92bc8c6fd8c8cf9c04cfab4ad6b4ac47063a24835ce5b')

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
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
