# Script generated with create_pkgbuild.py
    # For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
    pkgdesc="ROS - This package provides common interfaces for navigation specific robot actions."
    url='http://wiki.ros.org/mbf_abstract_core'

    pkgname='ros-melodic-mbf-abstract-core'
    pkgver='0.2.5'
    arch=('any')
    pkgrel=1
    license=('BSD')

    ros_makedepends=(ros-melodic-std-msgs
  ros-melodic-geometry-msgs
  ros-melodic-catkin)
    makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    )

    ros_depends=(ros-melodic-std-msgs
  ros-melodic-geometry-msgs)
    depends=(${ros_depends[@]}
    )
    
    # Tarball version (faster download)
    _dir="move_base_flex-release-release-melodic-mbf_abstract_core"
    source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/uos-gbp/move_base_flex-release/archive/release/melodic/mbf_abstract_core/${pkgver}.tar.gz")
    sha256sums=('8fbdcdfa35cd395dda8cea29b17960fbd086937a26157df7fc97975ee366180e')

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
    