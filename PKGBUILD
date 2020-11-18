# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS Definition of msgs and services used by some Robotnik's packages"
url='http://wiki.ros.org/robotnik_msgs'


pkgname='ros-melodic-robotnik-msgs'
pkgver='1.0.0'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')


ros_makedepends=(ros-melodic-catkin
                 ros-melodic-message-generation
                 ros-melodic-actionlib-msgs
                 ros-melodic-geometry-msgs
                 ros-melodic-std-msgs
                 )
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  git)

ros_depends=(ros-melodic-message-runtime
             ros-melodic-actionlib-msgs
             ros-melodic-geometry-msgs
             ros-melodic-std-msgs
             )
depends=(${ros_depends[@]}
  python-rospkg)


# Git version (e.g. for debugging)
_tag=${pkgver}
_dir=${pkgname}
source=("${_dir}"::"git+https://github.com/RobotnikAutomation/robotnik_msgs.git"#tag=${_tag})
sha256sums=('SKIP')

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
        -DPYTHON_BASENAME=-python3.8 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}  
