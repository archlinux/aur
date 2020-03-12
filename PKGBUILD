# Script generated with create_pkgbuild.py
    # For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
    pkgdesc="ROS - ROS device driver for Velodyne 3D LIDARs."
    url='h'

    pkgname='ros-melodic-velodyne-driver'
    pkgver='1.5.2'
    arch=('any')
    pkgrel=1
    license=('BSD')

    ros_makedepends=(ros-melodic-pluginlib
  ros-melodic-dynamic-reconfigure
  ros-melodic-diagnostic-updater
  ros-melodic-roscpp
  ros-melodic-nodelet
  ros-melodic-tf
  ros-melodic-catkin
  ros-melodic-velodyne-msgs)
    makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    libpcap)

    ros_depends=(ros-melodic-pluginlib
  ros-melodic-dynamic-reconfigure
  ros-melodic-diagnostic-updater
  ros-melodic-roscpp
  ros-melodic-nodelet
  ros-melodic-tf
  ros-melodic-velodyne-msgs)
    depends=(${ros_depends[@]}
    libpcap)
    _dir=velodyne-release-release-melodic-velodyne_driver
    source=(""${pkgname}-${pkgver}.tar.gz""::""https://github.com/ros-drivers-gbp/velodyne-release/archive/release/melodic/velodyne_driver/${pkgver}.tar.gz"")
    sha256sums=('f511e5be3ff01e56f20e950373921dfc9b7e225aac7ee83ff67b4aee9c4c73f8')
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
    