# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This package retrieves data from url-format files such as http://, ftp://, package:// file://, etc., and loads the data into memory."
url='https://wiki.ros.org/resource_retriever'

pkgname='ros-melodic-resource-retriever'
pkgver='1.12.6'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-melodic-rosconsole
	ros-melodic-catkin
	ros-melodic-roslib
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost1.69
	curl
)

ros_depends=(
	ros-melodic-rosconsole
	ros-melodic-roslib
)

depends=(
	${ros_depends[@]}
	boost1.69
	python-rospkg
	curl
)

_dir="resource_retriever-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/resource_retriever/archive/${pkgver}.tar.gz")
sha256sums=('dd44ffa5838b47d34485c66332727989f087ddf025da7ef3f66a2935c71fcab3')

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
