# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="hector_gazebo_plugins provides gazebo plugins from Team Hector. 6wd,  IMU, magnetic field, GPS sonar ranger"
url='http://http://wiki.ros.org/hector_gazebo_plugins'


pkgname='ros-kinetic-hector-gazebo-plugins'
pkgver='0.5.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')


ros_makedepends=(ros-kinetic-catkin
                 ros-kinetic-roscpp
                 ros-kinetic-gazebo-dev
                 ros-kinetic-std-msgs
                 ros-kinetic-std-srvs
                 ros-kinetic-geometry-msgs
                 ros-kinetic-nav-msgs
                 ros-kinetic-tf
                 ros-kinetic-dynamic-reconfigure
                 ros-kinetic-message-generation
                 ros-kinetic-gazebo-plugins
                 )
makedepends=('cmake' 'ros-build-tools' 'gazebo'
  ${ros_makedepends[@]})

ros_depends=(  ros-kinetic-roscpp
  ros-kinetic-gazebo-ros
  ros-kinetic-gazebo-plugins
  ros-kinetic-std-msgs
  ros-kinetic-std-srvs
  ros-kinetic-geometry-msgs
  ros-kinetic-nav-msgs
  ros-kinetic-tf
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-message-runtime
             )
depends=(${ros_depends[@]}
  python2-rospkg
  python2-netifaces)


# Git version (e.g. for debugging)
_tag=${pkgver}
_dir=${pkgname}
source=("${_dir}"::"git+https://github.com/tu-darmstadt-ros-pkg/hector_gazebo.git"#tag=${_tag})
sha256sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/kinetic/setup.bash ] && source /opt/ros/kinetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}/hector_gazebo_plugins

  # Build project
  cmake ${srcdir}/${_dir}/hector_gazebo_plugins \
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
