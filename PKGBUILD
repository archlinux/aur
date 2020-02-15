# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Contains nodelets for processing depth images such as those produced by OpenNI camera."
url='https://wiki.ros.org/depth_image_proc'

pkgname='ros-melodic-depth-image-proc'
pkgver='1.12.23'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-melodic-tf2
	ros-melodic-image-geometry
	ros-melodic-nodelet
	ros-melodic-cmake-modules
	ros-melodic-stereo-msgs
	ros-melodic-catkin
	ros-melodic-cv-bridge
	ros-melodic-eigen-conversions
	ros-melodic-tf2-ros
	ros-melodic-message-filters
	ros-melodic-sensor-msgs
	ros-melodic-image-transport
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost
)

ros_depends=(
	ros-melodic-image-geometry
	ros-melodic-nodelet
	ros-melodic-cv-bridge
	ros-melodic-eigen-conversions
	ros-melodic-tf2-ros
	ros-melodic-tf2
	ros-melodic-image-transport
)

depends=(
	${ros_depends[@]}
	boost
)

_dir="image_pipeline-${pkgver}/depth_image_proc"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/image_pipeline/archive/${pkgver}.tar.gz")
sha256sums=('0b024f155f79f16982b31951ad0b1bde5440159b0ba6b1128ecbe2e867a2e357')

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
