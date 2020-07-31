# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - Combined Robot HW class."
url='http://wiki.ros.org/combined_robot_hw'

pkgname='ros-melodic-combined-robot-hw'
pkgver='0.18.1'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-roscpp
    ros-melodic-catkin
    ros-melodic-hardware-interface
    ros-melodic-pluginlib)
makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    )

ros_depends=(ros-melodic-roscpp
    ros-melodic-hardware-interface
    ros-melodic-pluginlib)
depends=(${ros_depends[@]}
    )

_dir="ros_control-release-release-melodic-combined_robot_hw"
source=("${pkgname}-${pkgver}-.tar.gz"::"https://github.com/ros-gbp/ros_control-release/archive/release/melodic/combined_robot_hw/${pkgver}.tar.gz")
sha256sums=('775c10c9a50135cdffaeddafcf595fedbdd2c6d06bde278aabc66ac9127c1ba0')

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
      -DSETUPTOOLS_DEB_LAYOUT=OFF
      make
}

package() {
  cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}



