# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package contains generic definitions of geometric shapes and bodies."
url='http://wiki.ros.org/geometric_shapes'

pkgname='ros-melodic-geometric-shapes'
pkgver='0.6.3'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-resource-retriever
  ros-melodic-eigen-stl-containers
  ros-melodic-catkin
  ros-melodic-octomap
  ros-melodic-shape-msgs
  ros-melodic-random-numbers
  ros-melodic-visualization-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qhull
  assimp
  eigen
  boost1.69
  console-bridge
  pkg-config)

ros_depends=(ros-melodic-resource-retriever
  ros-melodic-eigen-stl-containers
  ros-melodic-octomap
  ros-melodic-shape-msgs
  ros-melodic-random-numbers
  ros-melodic-visualization-msgs)
depends=(${ros_depends[@]}
  assimp
  boost1.69
  eigen
  console-bridge
  qhull)

_dir="geometric_shapes-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/geometric_shapes/archive/${pkgver}.tar.gz")
sha256sums=('c7b247cf73a314f673e200642d6ffc7d079e91af1ddd4a1e82e1d8a355596b2c')

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
