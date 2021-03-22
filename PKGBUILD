# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This package contains a recent version of the Kinematics and Dynamics Library (KDL), distributed by the Orocos Project."
url='https://wiki.ros.org/orocos_kdl'

pkgname='ros-melodic-orocos-kdl'
pkgver='1.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=4
license=('LGPL')

ros_makedepends=(
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	eigen
)

ros_depends=(
	ros-melodic-catkin
)

depends=(
	${ros_depends[@]}
	eigen
	pkg-config
)

_dir="orocos_kinematics_dynamics-${pkgver}/orocos_kdl"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/orocos/orocos_kinematics_dynamics/archive/v${pkgver}.tar.gz")
sha256sums=('05b93e759923684dc07433ccae1e476d158d89b3c2be5079c20062406da7b4dd')

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
