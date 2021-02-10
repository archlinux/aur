# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Unit-testing package for ROS."
url='https://wiki.ros.org/rosunit'

pkgname='ros-noetic-rosunit'
pkgver='1.15.7'
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
	ros-noetic-roslib
)

depends=(
	${ros_depends[@]}
	python-rospkg
)

_dir="ros-${pkgver}/tools/rosunit"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/ros/archive/${pkgver}.tar.gz")
sha256sums=('7a1e729de9be807862b6ed721475fec74583f6dc0c06b233b06b1b9fda31291e')

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
