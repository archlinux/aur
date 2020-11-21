# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS Module Twist multiplexer, which multiplex several velocity commands (topics) and allows to priorize or disable them (locks)."
url='http://wiki.ros.org/twist_mux'


pkgname='ros-melodic-twist-mux'
pkgver='3.1.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')


ros_makedepends=(ros-melodic-catkin
                 ros-melodic-roscpp
                 ros-melodic-std-msgs
                 ros-melodic-geometry-msgs
                 ros-melodic-visualization-msgs
                 ros-melodic-diagnostic-updater
                 ros-melodic-rostest
                 ros-melodic-rospy
                 ros-melodic-rostopic
                 )
makedepends=('git' 'cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-roscpp
                 ros-melodic-std-msgs
                 ros-melodic-geometry-msgs
                 ros-melodic-visualization-msgs
                 ros-melodic-twist-mux-msgs
                 ros-melodic-diagnostic-updater
             )
depends=(${ros_depends[@]}
  python-rospkg)



# Git version (e.g. for debugging)
_tag=${pkgver}
_dir=${pkgname}
source=("${_dir}"::"git+https://github.com/ros-teleop/twist_mux.git"#tag=${_tag})
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
