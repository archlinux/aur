pkgname="ros-noetic-panda-moveit-config"
pkgver="0.7.4"
pkgrel=1
pkgdesc="Franka Emika Panda MoveIt! Config Package"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="http://wiki.ros.org/panda_moveit_config"
license=('Apache')

ros_makedepends=(
    'ros-noetic-catkin'
)

makedepends=(
    'cmake'
    'ros-build-tools'
    ${ros_makedepends[@]}
)

ros_depends=()

depends=(
    ${ros_depends[@]}
)

source=("panda_moveit_config-$pkgver.tar.gz::https://github.com/ros-planning/panda_moveit_config/archive/$pkgver.tar.gz")
sha256sums=(d989d7a854cf65f994add6090e9a5609ae19bbe3b46c223c9ca9aceec0d357d1)


build() {
	# Use ROS environment variables
  	source /usr/share/ros-build-tools/clear-ros-env.sh
  	[ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

	# Create build directory
  	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  	cd ${srcdir}/build

	# Build project
	cmake ${srcdir}/panda_moveit_config-$pkgver \
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
