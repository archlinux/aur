# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Parser for Semantic Robot Description Format (SRDF)."
url='https://wiki.ros.org/srdfdom'

pkgname='ros-melodic-srdfdom'
pkgver='0.5.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-urdfdom-py
  ros-melodic-urdf
  ros-melodic-catkin
  ros-melodic-cmake-modules
  ros-melodic-rostest)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost1.69
  console-bridge
  tinyxml
  urdfdom-headers)

ros_depends=(ros-melodic-urdfdom-py)
depends=(${ros_depends[@]}
  boost1.69
  console-bridge
  tinyxml
  urdfdom-headers)

_dir="srdfdom-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/srdfdom/archive/${pkgver}.tar.gz")
sha256sums=('05cc6eda2a1ca4c0344eb9b97cddc69c19934ed35b9c55fc4b59eb07e80bff66')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

  # Build project
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
