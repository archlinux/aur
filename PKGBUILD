# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - Move Base Flex (MBF) is a backwards-compatible replacement for move_base."
url='http://wiki.ros.org/move_base_flex'

pkgname='ros-melodic-move-base-flex'
pkgver='0.3.4'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    )

ros_depends=(ros-melodic-mbf-costmap-nav
  ros-melodic-mbf-msgs
  ros-melodic-mbf-costmap-core
  ros-melodic-mbf-abstract-core
  ros-melodic-mbf-abstract-nav
  ros-melodic-mbf-simple-nav)
depends=(${ros_depends[@]}
    )
# Tarball version (faster download)
_dir="move_base_flex-release-release-melodic-move_base_flex"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/uos-gbp/move_base_flex-release/archive/release/melodic/move_base_flex/${pkgver}.tar.gz")
sha256sums=('4b0f5887b974c2f98ba3d206805082b5ed4640b5d20ce93243a500bac458e25f')
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
                -DPYTHON_INCLUDE_DIR=/usr/include/python3.8m \
                -DPYTHON_LIBRARY=/usr/lib/libpython3.8m.so \
                -DPYTHON_BASENAME=.cpython-38m \
                -DSETUPTOOLS_DEB_LAYOUT=OFF
        make
    }

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
    
