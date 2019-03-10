# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - MRPT - Bridge"
url='http://wiki.ros.org/mrpt_bridge'

pkgname='ros-kinetic-mrpt-bridge'
pkgver='0.1.25'
_pkgver_patch=0
arch=('any')
pkgrel=0
license=('BSD')

ros_makedepends=('ros-kinetic-catkin' 'ros-kinetic-geometry-msgs' 
                 'ros-kinetic-marker-msgs'
                 'ros-kinetic-message-generation' 'ros-kinetic-message-runtime' 
                 'ros-kinetic-mrpt-msgs' 'ros-kinetic-nav-msgs' 
                 'ros-kinetic-pcl-conversions' 'ros-kinetic-roscpp' 
                 'ros-kinetic-rospy' 'ros-kinetic-sensor-msgs' 'ros-kinetic-std-msgs' 'ros-kinetic-tf')
makedepends=('cmake' 'git' 'ros-build-tools' 'mrpt'
  ${ros_makedepends[@]})

ros_depends=()
depends=(${ros_depends[@]})

_tag=${pkgver}
_dir=mrpt_bridge
source=("${_dir}"::"git+https://github.com/mrpt-ros-pkg/mrpt_bridge"#tag=${_tag})
md5sums=('SKIP')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DCATKIN_ENABLE_TESTING=0
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

