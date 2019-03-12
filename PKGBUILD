# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS Definition of msgs and services used by some Robotnik's packages"
url='http://wiki.ros.org/robotnik_msgs'


pkgname='ros-kinetic-robotnik-msgs'
pkgver='0.2.5'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')


ros_makedepends=(ros-kinetic-catkin
                 ros-kinetic-message-generation
                 ros-kinetic-std-msgs
                 )
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-message-runtime
             ros-kinetic-std-msgs
             )
depends=(${ros_depends[@]}
  python2-rospkg)


# Git version (e.g. for debugging)
_tag=kinetic-${pkgver}
_dir=${pkgname}
source=("${_dir}"::"git+https://github.com/RobotnikAutomation/robotnik_msgs.git"#tag=${_tag})
sha256sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/kinetic/setup.bash ] && source /opt/ros/kinetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/kinetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}  
