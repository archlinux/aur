# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Stereo and single image rectification and disparity processing."
url='https://github.com/ros-perception/image_pipeline'

pkgname='ros-melodic-stereo-image-proc'
pkgver='1.15.0'
_pkgver_patch=0
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-melodic-image-geometry
	ros-melodic-nodelet
	ros-melodic-dynamic-reconfigure
	ros-melodic-stereo-msgs
	ros-melodic-catkin
	ros-melodic-cv-bridge
	ros-melodic-image-proc
	ros-melodic-message-filters
	ros-melodic-sensor-msgs
	ros-melodic-image-transport
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-image-geometry
	ros-melodic-nodelet
	ros-melodic-dynamic-reconfigure
	ros-melodic-stereo-msgs
	ros-melodic-cv-bridge
	ros-melodic-image-proc
	ros-melodic-message-filters
	ros-melodic-sensor-msgs
	ros-melodic-image-transport
)

depends=(
	${ros_depends[@]}
)

_dir="image_pipeline-melodic-${pkgver}/stereo_image_proc"
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
		-DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
		-DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
		-DPYTHON_BASENAME=.cpython-37m \
		-DSETUPTOOLS_DEB_LAYOUT=OFF \
                -DBOOST_ROOT=/opt/boost1.69
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
