pkgname="ros-melodic-panda-moveit-config"
pkgver="0.7.4"
pkgrel=3
pkgdesc="Franka Emika Panda MoveIt! Config Package"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="http://wiki.ros.org/panda_moveit_config"
license=('Apache')

ros_makedepends=(
    'ros-melodic-catkin'
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

provides=($pkgname)
conflicts=($pkgname)
_dir="panda_moveit_config-$pkgver"
source=("ros-melodic-panda-moveit-config-$pkgver.tar.gz::https://github.com/ros-planning/panda_moveit_config/archive/$pkgver.tar.gz")
sha256sums=('d989d7a854cf65f994add6090e9a5609ae19bbe3b46c223c9ca9aceec0d357d1')


build() {
	# Use ROS environment variables
  	source /usr/share/ros-build-tools/clear-ros-env.sh
  	[ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

	# Create build directory
  	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  	cd ${srcdir}/build

	# Build project
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
