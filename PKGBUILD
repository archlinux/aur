# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - MRPT - Bridge"
url='http://wiki.ros.org/mrpt_bridge'

pkgname='ros-melodic-mrpt-bridge'
pkgver='0.1.25'
_pkgver_patch=0
arch=('any')
pkgrel=0
license=('BSD')

ros_makedepends=('ros-melodic-catkin' 'ros-melodic-geometry-msgs' 
                 'ros-melodic-marker-msgs'
                 'ros-melodic-message-generation' 'ros-melodic-message-runtime' 
                 'ros-melodic-mrpt-msgs' 'ros-melodic-nav-msgs' 
                 'ros-melodic-pcl-conversions' 'ros-melodic-roscpp' 
                 'ros-melodic-rospy' 'ros-melodic-sensor-msgs' 'ros-melodic-std-msgs' 'ros-melodic-tf')
makedepends=('cmake' 'git' 'ros-build-tools' 'mrpt'
  ${ros_makedepends[@]})

ros_depends=()
depends=(${ros_depends[@]})

_tag=${pkgver}
_dir=mrpt_bridge
_commit=84099e91aaf344fb79c5bac3edb5f742b070343c
source=("${_dir}"::"git+https://github.com/mrpt-ros-pkg/mrpt_bridge"#commit=${_commit})
md5sums=('SKIP')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DCATKIN_ENABLE_TESTING=0
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}


