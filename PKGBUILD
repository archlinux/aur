# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - velocity_controllers."
url='https://github.com/ros-controls/ros_controllers/wiki'

pkgname='ros-melodic-velocity-controllers'
pkgver='0.17.1'
_pkgver_patch=1
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-control-msgs
  ros-melodic-controller-interface
  ros-melodic-control-toolbox
  ros-melodic-realtime-tools
  ros-melodic-angles
  ros-melodic-catkin
  ros-melodic-forward-command-controller
  ros-melodic-urdf)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-control-msgs
  ros-melodic-controller-interface
  ros-melodic-control-toolbox
  ros-melodic-realtime-tools
  ros-melodic-angles
  ros-melodic-forward-command-controller
  ros-melodic-urdf)
depends=(${ros_depends[@]})

#_tag=melodic_devel
#_commit=b480d5f06568b31b8c68a54de8042e1d63d01534
#_dir=ros_controllers
#source=("${_dir}"::"git+https://github.com/ros-controls/ros_controllers"#commit=${_commit})
#md5sums=('SKIP')

# Tarball version (faster download)
_dir="ros_controllers-release-release-melodic-velocity_controllers-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_controllers-release/archive/release/melodic/velocity_controllers/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('b48fda80fcab413de486c6183495f5e28ca1bd28ab8fe02764ee8572087cf2cc')


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
