# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - A metapackage which extends ros_base and includes ROS libaries for any robot hardware."
url='https://wiki.ros.org/robot'

pkgname='ros-melodic-robot'
pkgver='1.4.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
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
	ros-melodic-filters
	ros-melodic-ros-base
	ros-melodic-joint-state-publisher
	ros-melodic-executive-smach
	ros-melodic-urdf-parser-plugin
	ros-melodic-xacro
	ros-melodic-diagnostics
	ros-melodic-robot-state-publisher
	ros-melodic-kdl-parser-py
	ros-melodic-geometry
	ros-melodic-urdf
	ros-melodic-control-msgs
	ros-melodic-kdl-parser
)

depends=(
	${ros_depends[@]}
)

_dir="metapackages-release-release-melodic-robot-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/metapackages-release/archive/release/melodic/robot/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('4f0efd47cf90e8a1f56602612d73ba032fbb231dec3091f53b795a7d67cbe02b')

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
