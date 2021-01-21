# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - node to publish a video stream in ROS image topics"
url='https://wiki.ros.org/video_stream_opencv'

pkgname='ros-melodic-video-stream-opencv'
pkgver='1.1.6'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-roscpp
  ros-melodic-dynamic-reconfigure
  ros-melodic-image-transport
  ros-melodic-rospy
  ros-melodic-camera-info-manager
  ros-melodic-sensor-msgs
  ros-melodic-catkin
  ros-melodic-cv-bridge
  ros-melodic-nodelet)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-roscpp
  ros-melodic-dynamic-reconfigure
  ros-melodic-image-transport
  ros-melodic-rospy
  ros-melodic-camera-info-manager
  ros-melodic-sensor-msgs
  ros-melodic-cv-bridge
  ros-melodic-nodelet)
depends=(${ros_depends[@]})

_dir=video_stream_opencv-release-release-melodic-video_stream_opencv
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/video_stream_opencv-release/archive/release/melodic/video_stream_opencv/${pkgver}.tar.gz")
sha256sums=('7521776a894039f7a54a42969f434fbe9bff9a779bd93642967e9f00b8756b3e')

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
            -DPYTHON_INCLUDE_DIR=/usr/include/python3.8m \
            -DPYTHON_LIBRARY=/usr/lib/libpython3.8m.so \
            -DPYTHON_BASENAME=.cpython-38m \
            -DSETUPTOOLS_DEB_LAYOUT=OFF
    make
}

package() {
cd "${srcdir}/build"
make DESTDIR="${pkgdir}/" install
}
