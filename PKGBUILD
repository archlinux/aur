# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgdesc="ROS - rosparam wrapper with improved error checking."
url='https://github.com/PickNikRobotics/rosparam_shortcuts'

pkgname='ros-melodic-rosparam-shortcuts'
pkgver='0.3.1'
arch=('x86_64')
pkgrel=1
license=('unknown')

_ros_makedepends=(
	ros-melodic-catkin
  ros-melodic-eigen-conversions
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${_ros_makedepends[@]}
)

_ros_depends=(
	ros-melodic-rosparam
  ros-melodic-rosout
)

depends=(
	${_ros_depends[@]}
)

source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/PickNikRobotics/rosparam_shortcuts/archive/${pkgver}.tar.gz")
sha256sums=('5b35e30a8e12c4ed6c2ad6ad8612ab1d280e5272ded4cafa567733fa4d59e073')

build() {
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  _dir="rosparam_shortcuts-${pkgver}"
  # Create the build directory.
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

	# Build the project.
	cmake ${srcdir}/${_dir} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCATKIN_BUILD_BINARY_PACKAGE=ON \
		-DCMAKE_INSTALL_PREFIX=/opt/ros/melodic
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
