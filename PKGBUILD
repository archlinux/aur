# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - ros_tutorials contains packages that demonstrate various features of ROS, as well as support packages which help demonstrate those features."
url='https://www.wiki.ros.org/ros_tutorials'

pkgname='ros-melodic-ros-tutorials'
pkgver='0.9.3'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
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
	ros-melodic-roscpp-tutorials
	ros-melodic-rospy-tutorials
	ros-melodic-turtlesim
)

depends=(
	${ros_depends[@]}
)

_dir="ros_tutorials-${pkgver}/ros_tutorials"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/ros_tutorials/archive/${pkgver}.tar.gz")
sha256sums=('eb43cb3d99bc84f5dd364801887af129dddc8f45e6055d7ed7ce7955925e0e6c')

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
