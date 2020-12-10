# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - C++ implementation of bond, a mechanism for checking when another process has terminated."
url='https://www.wiki.ros.org/bondcpp'

pkgname='ros-melodic-bondcpp'
pkgver='1.8.5'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-melodic-cmake-modules
	ros-melodic-catkin
	ros-melodic-smclib
	ros-melodic-roscpp
	ros-melodic-bond
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost1.69
	util-linux
)

ros_depends=(
	ros-melodic-roscpp
	ros-melodic-smclib
	ros-melodic-bond
)

depends=(
	${ros_depends[@]}
	boost1.69
	util-linux
)

optdepends=(
)


_dir="bond_core-${pkgver}/bondcpp"
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
		-DSETUPTOOLS_DEB_LAYOUT=OFF \
	   -DBOOST_ROOT=/opt/boost1.69
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
