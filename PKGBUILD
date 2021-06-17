# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - Graphical frontend for interacting with the controller manager."
url='https://github.com/ros-controls/ros_control/wiki'

pkgname='ros-melodic-rqt-controller-manager'
pkgver='0.18.4'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin)
  makedepends=('cmake' 'ros-build-tools'
      ${ros_makedepends[@]}
      )

  ros_depends=(ros-melodic-rqt-gui
      ros-melodic-rqt-gui-py
      ros-melodic-rospy
      ros-melodic-controller-manager-msgs)
depends=(${ros_depends[@]}
    )

# Tarball version (faster download)
_dir="ros_control-${pkgver}/rqt_controller_manager"
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

