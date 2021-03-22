# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Package that implemets a costmap layer to add prohibited areas to
the costmap-2D by a user configuration."
url='https://wiki.ros.org/costmap_prohibition_layer'

pkgname='ros-melodic-costmap-prohibition-layer'
pkgver='0.0.5'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
    ros-melodic-catkin
    ros-melodic-costmap-2d
    ros-melodic-dynamic-reconfigure
    ros-melodic-roscpp
)

makedepends=(
    cmake
    ros-build-tools
	${ros_makedepends[@]}
)

ros_depends=(
    ros-melodic-costmap-2d
    ros-melodic-dynamic-reconfigure
    ros-melodic-roscpp
)

depends=(
	${ros_depends[@]}
)

_dir="costmap_prohibition_layer-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/rst-tu-dortmund/costmap_prohibition_layer/archive/${pkgver}.tar.gz")
sha256sums=('4286f5a0b0ddda1b88023b1546b4f3dc2a200ff54183cf061323e4f8cf572a0b')

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
