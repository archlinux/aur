# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - turtlebot_bringup provides roslaunch scripts for starting the TurtleBot base functionality."
url='http://ros.org/wiki/turtlebot_bringup'

pkgname='ros-indigo-turtlebot-bringup'
pkgver='2.3.11'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-openni2-launch
  ros-indigo-yocs-cmd-vel-mux
  ros-indigo-freenect-launch
  ros-indigo-kobuki-bumper2pc
  ros-indigo-turtlebot-description
  ros-indigo-zeroconf-avahi
  ros-indigo-depthimage-to-laserscan
  ros-indigo-create-node
  ros-indigo-rocon-bubble-icons
  ros-indigo-rocon-app-manager
  ros-indigo-robot-state-publisher
  ros-indigo-laptop-battery-monitor
  ros-indigo-kobuki-safety-controller
  ros-indigo-diagnostic-aggregator
  ros-indigo-robot-pose-ekf
  ros-indigo-turtlebot-capabilities
  ros-indigo-kobuki-capabilities
  ros-indigo-kobuki-node)
depends=(${ros_depends[@]})

_tag=release/indigo/turtlebot_bringup/${pkgver}-${_pkgver_patch}
_dir=turtlebot_bringup
source=("${_dir}"::"git+https://github.com/turtlebot-release/turtlebot-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
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
