# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Python ROS message and service generators."
url='https://wiki.ros.org/genpy'

pkgname='ros-melodic-genpy'
pkgver='0.6.14'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-melodic-genmsg
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-genmsg
)

depends=(
	${ros_depends[@]}
	python-yaml
)

_dir="genpy-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/genpy/archive/${pkgver}.tar.gz")
sha256sums=('523d20068171ce7e5b4c453eba7976aafa819e6b5af806ffdf6bc1d7a1dfc2a8')

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
