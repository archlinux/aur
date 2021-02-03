# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgdesc="ROS - ROS messages for the cartographer_ros package."
url='https://github.com/googlecartographer/cartographer_ros'

pkgname='ros-noetic-cartographer-ros-msgs'
pkgver='1.0.0'
arch=('any')
pkgrel=1
license=('Apache 2.0')

ros_makedepends=(
  ros-noetic-std-msgs
  ros-noetic-catkin
  ros-noetic-geometry-msgs
  ros-noetic-message-generation
)

makedepends=(
  cmake
  ros-build-tools
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-noetic-message-runtime
  ros-noetic-geometry-msgs
  ros-noetic-std-msgs
)
depends=(${ros_depends[@]})

# Tarball version (faster download)
_dir="cartographer_ros-release-release-melodic-cartographer_ros_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-gbp/cartographer_ros-release/archive/release/melodic/cartographer_ros_msgs/${pkgver}.tar.gz")
sha256sums=('f4c49c3912743815c94cae90288e044b2af9fade2b210418e7659a8ba70175d4')

build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Create build directory
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    rm -f ${srcdir}/${_dir}/cartographer/mapping/3d/hybrid_grid_test.cc

    # Build project
    cmake ${srcdir}/${_dir} \
            -DCMAKE_BUILD_TYPE=Release \
            -DCATKIN_ENABLE_TESTING=0 \
            -DCATKIN_BUILD_BINARY_PACKAGE=ON \
            -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
            -DPYTHON_EXECUTABLE=/usr/bin/python3 \
            -DPYTHON_INCLUDE_DIR=/usr/include/python3.9 \
            -DPYTHON_LIBRARY=/usr/lib/libpython3.9.so \
            -DPYTHON_BASENAME=-python3.9 \
            -DSETUPTOOLS_DEB_LAYOUT=OFF
            make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
