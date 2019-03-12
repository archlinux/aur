# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS Module Twist multiplexer, which multiplex several velocity commands (topics) and allows to priorize or disable them (locks)."
url='http://wiki.ros.org/twist_mux'


pkgname='ros-kinetic-twist-mux'
pkgver='3.1.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')


ros_makedepends=(ros-kinetic-catkin
                 ros-kinetic-roscpp
                 ros-kinetic-std-msgs
                 ros-kinetic-geometry-msgs
                 ros-kinetic-visualization-msgs
                 ros-kinetic-diagnostic-updater
                 ros-kinetic-rostest
                 ros-kinetic-rospy
                 ros-kinetic-rostopic
                 )
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-roscpp
                 ros-kinetic-std-msgs
                 ros-kinetic-geometry-msgs
                 ros-kinetic-visualization-msgs
                 ros-kinetic-twist-mux-msgs
                 ros-kinetic-diagnostic-updater
             )
depends=(${ros_depends[@]}
  python2-rospkg)



# Git version (e.g. for debugging)
_tag=${pkgver}
_dir=${pkgname}
source=("${_dir}"::"git+https://github.com/ros-teleop/twist_mux.git"#tag=${_tag})
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
