# Script generated with create_pkgbuild.py
    # For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
    pkgdesc="ROS - ROS message definitions for Velodyne 3D LIDARs."
    url='h'

    pkgname='ros-melodic-velodyne-msgs'
    pkgver='1.5.2'
    arch=('any')
    pkgrel=1
    license=('BSD')

    ros_makedepends=(ros-melodic-catkin
  ros-melodic-std-msgs
  ros-melodic-message-generation)
    makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    )

    ros_depends=(ros-melodic-std-msgs
  ros-melodic-message-runtime)
    depends=(${ros_depends[@]}
    )
    _dir=velodyne-release-release-melodic-velodyne_msgs
    source=(""${pkgname}-${pkgver}.tar.gz""::""https://github.com/ros-drivers-gbp/velodyne-release/archive/release/melodic/velodyne_msgs/${pkgver}.tar.gz"")
    sha256sums=('914c1ba9bb916abd7462bc2539417ed7924ed1a504270ffc001375d57c103c21')
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
    