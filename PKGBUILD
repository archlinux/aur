# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - ROS wrapper for the Simple Open EtherCAT Master SOEM."
url='http://wiki.ros.org/soem'

pkgname='ros-melodic-soem'
pkgver='1.4.1003'
arch=('any')
pkgrel=1
license=('GPLv2 with linking exception')

ros_makedepends=(ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
${ros_makedepends[@]}
)

ros_depends=()
depends=(${ros_depends[@]}
)

_dir="soem-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/mgruhler/soem/archive/${pkgver}.tar.gz")
sha256sums=('146be1a7dc88e2db5834bdf9378c0ce4a71273408bcf3965c3f26d9006fd068a')


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

