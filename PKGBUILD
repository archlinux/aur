# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - The industrial message package containes industrial specific messages definitions."
url='http://ros.org/wiki/industrial_msg'

pkgname='ros-melodic-industrial-msgs'
pkgver='0.7.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
  ros-melodic-catkin
  ros-melodic-trajectory-msgs
  ros-melodic-std-msgs
  ros-melodic-message-generation
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-melodic-message-runtime
  ros-melodic-std-msgs
  ros-melodic-trajectory-msgs
)

depends=(
  ${ros_depends[@]}
)

_dir="industrial_core-${pkgver}/industrial_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-industrial/industrial_core/archive/${pkgver}.tar.gz")
sha256sums=('73fdca1965713e746c38fbcf691476288d2876c36222a97f0725835ac8548783')


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
    -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 \
    -DPYTHON_LIBRARY=/usr/lib/libpython3.8.so \
    -DPYTHON_BASENAME=.cpython-38 \
    -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
