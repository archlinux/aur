# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - A set of packages that include controller interfaces, controller managers, transmissions and hardware_interfaces."
url='https://github.com/ros-controls/ros_control/wiki'

pkgname='ros-melodic-ros-control'
pkgver='0.18.4'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin)
  makedepends=('cmake' 'ros-build-tools'
      ${ros_makedepends[@]}
      )

  ros_depends=(ros-melodic-combined-robot-hw
      ros-melodic-realtime-tools
      ros-melodic-controller-manager-msgs
      ros-melodic-controller-interface
      ros-melodic-hardware-interface
      ros-melodic-transmission-interface
      ros-melodic-joint-limits-interface
      ros-melodic-controller-manager)
depends=(${ros_depends[@]}
    )

_dir="ros_control-${pkgver}/ros_control"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-controls/ros_control/archive/${pkgver}.tar.gz")
sha256sums=('c4e289e2bfafb418c22cf31f8fb656b697b1629a51631bdc12a3f3ed4e59af20')

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

