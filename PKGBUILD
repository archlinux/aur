# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - The State Machine Compiler (SMC) from https://smc.sourceforge.net/ converts a language-independent description of a state machine into the source code to support that state machine."
url='https://smc.sourceforge.net/'

pkgname='ros-melodic-smclib'
pkgver='1.8.5'
arch=('any')
pkgrel=2
license=('Mozilla Public License Version 1.1')

ros_makedepends=(
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
)

depends=(
	${ros_depends[@]}
)

_dir="bond_core-${pkgver}/smclib"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/bond_core/archive/${pkgver}.tar.gz")
sha256sums=('b70f0fe5b4979fe2e7390bff9671b2581eefa91f4ac41f4af01eb1f2bef0e1f4')

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
