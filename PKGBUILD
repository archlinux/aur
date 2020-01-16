# Script generated with create_pkgbuild.py
    # For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
    pkgdesc="ROS - ROS messages for the cartographer_ros package."
    url='https://github.com/googlecartographer/cartographer_ros'

    pkgname='ros-melodic-cartographer-ros-msgs'
    pkgver='1.0.0'
    arch=('any')
    pkgrel=1
    license=('Apache 2.0')

    ros_makedepends=(ros-melodic-std-msgs
  ros-melodic-catkin
  ros-melodic-geometry-msgs
  ros-melodic-message-generation)
    makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    )

    ros_depends=(ros-melodic-message-runtime
  ros-melodic-geometry-msgs
  ros-melodic-std-msgs)
    depends=(${ros_depends[@]}
    )
    
    # Tarball version (faster download)
    _dir="cartographer_ros-release-release-melodic-cartographer_ros_msgs"
    source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-gbp/cartographer_ros-release/archive/release/melodic/cartographer_ros_msgs/${pkgver}.tar.gz")
    sha256sums=('f4c49c3912743815c94cae90288e044b2af9fade2b210418e7659a8ba70175d4')

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
                -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
                -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
                -DPYTHON_BASENAME=.cpython-37m \
                -DSETUPTOOLS_DEB_LAYOUT=OFF
    make
    }

    package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
    }
    