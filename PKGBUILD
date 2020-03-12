# Script generated with create_pkgbuild.py
    # For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
    pkgdesc="ROS - Basic ROS support for the Velodyne 3D LIDARs."
    url='h'

    pkgname='ros-melodic-velodyne'
    pkgver='1.5.2'
    arch=('any')
    pkgrel=1
    license=('BSD')

    ros_makedepends=(ros-melodic-catkin)
    makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    )

    ros_depends=(ros-melodic-velodyne-msgs
  ros-melodic-velodyne-driver
  ros-melodic-velodyne-laserscan
  ros-melodic-velodyne-pointcloud)
    depends=(${ros_depends[@]}
    )
    _dir=velodyne-release-release-melodic-velodyne
    source=(""${pkgname}-${pkgver}.tar.gz""::""https://github.com/ros-drivers-gbp/velodyne-release/archive/release/melodic/velodyne/${pkgver}.tar.gz"")
    sha256sums=('439295c760704e0db29117fa55c9d20c2a43eb866542895460730e84a66e272c')
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
    