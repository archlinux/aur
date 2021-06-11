# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - Simple simulation interface and template for setting up a hardware interface for ros_control."
url='https://github.com/davetcoleman/ros_control_boilerplate'

pkgname='ros-melodic-ros-control-boilerplate'
pkgver='0.5.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-melodic-rosparam-shortcuts
    ros-melodic-cmake-modules
    ros-melodic-joint-limits-interface
    ros-melodic-actionlib
    ros-melodic-urdf
    ros-melodic-control-msgs
    ros-melodic-catkin
    ros-melodic-control-toolbox
    ros-melodic-transmission-interface
    ros-melodic-hardware-interface
    ros-melodic-sensor-msgs
    ros-melodic-std-msgs
    ros-melodic-roscpp
    ros-melodic-controller-manager
    ros-melodic-trajectory-msgs)
makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    gflags)

ros_depends=(ros-melodic-rosparam-shortcuts
    ros-melodic-joint-limits-interface
    ros-melodic-actionlib
    ros-melodic-urdf
    ros-melodic-control-msgs
    ros-melodic-control-toolbox
    ros-melodic-transmission-interface
    ros-melodic-hardware-interface
    ros-melodic-sensor-msgs
    ros-melodic-std-msgs
    ros-melodic-roscpp
    ros-melodic-controller-manager
    ros-melodic-trajectory-msgs)
depends=(${ros_depends[@]}
    )

_dir="ros_control_boilerplate-${pkgver}/"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/PickNikRobotics/ros_control_boilerplate/archive/${pkgver}.tar.gz")
sha256sums=('d7effcf6b0c543827323db65f4716d6aff28f9ea9ab37dc73516f2fe02f9736f')

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

