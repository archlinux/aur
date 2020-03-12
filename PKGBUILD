# Script generated with create_pkgbuild.py
    # For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
    pkgdesc="ROS - Extract a single ring of a Velodyne PointCloud2 and publish it as a LaserScan message."
    url='h'

    pkgname='ros-melodic-velodyne-laserscan'
    pkgver='1.5.2'
    arch=('any')
    pkgrel=1
    license=('BSD')

    ros_makedepends=(ros-melodic-dynamic-reconfigure
  ros-melodic-roscpp
  ros-melodic-nodelet
  ros-melodic-catkin
  ros-melodic-sensor-msgs)
    makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    )

    ros_depends=(ros-melodic-nodelet
  ros-melodic-dynamic-reconfigure
  ros-melodic-sensor-msgs
  ros-melodic-roscpp)
    depends=(${ros_depends[@]}
    )
    _dir=velodyne-release-release-melodic-velodyne_laserscan
    source=(""${pkgname}-${pkgver}.tar.gz""::""https://github.com/ros-drivers-gbp/velodyne-release/archive/release/melodic/velodyne_laserscan/${pkgver}.tar.gz"")
    sha256sums=('d65cbd7cf5e48438ec123593723388fb4fb95dd2c70cafca986dc6f79b256655')
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
    