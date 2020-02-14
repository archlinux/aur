# Script generated with create_pkgbuild.py
    # For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
    pkgdesc="ROS - Provides a cmake config for the default version of Gazebo for the ROS distribution."
    url='h'

    pkgname='ros-melodic-gazebo-dev'
    pkgver='2.8.6'
    arch=('any')
    pkgrel=1
    license=('Apache 2.0')

    ros_makedepends=(ros-melodic-catkin)
    makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    )

    ros_depends=()
    depends=(${ros_depends[@]}
    gazebo)
    
    # Tarball version (faster download)
    _dir="gazebo_ros_pkgs-release-release-melodic-gazebo_dev"
    source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-gbp/gazebo_ros_pkgs-release/archive/release/melodic/gazebo_dev/${pkgver}.tar.gz")
    sha256sums=('4f9c464529a72e3ae361214c8196c86c4266b7d43f8a490eb778df394a7008a7')

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
                -DCATKIN_ENABLE_TESTING=0 \
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
    