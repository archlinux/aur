# Script generated with create_pkgbuild.py
    # For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
    pkgdesc="ROS - Serial is a cross-platform, simple to use library for using serial ports on computers."
    url='h'

    pkgname='ros-melodic-serial'
    pkgver='1.2.1'
    arch=('any')
    pkgrel=1
    license=('MIT')

    ros_makedepends=(ros-melodic-catkin)
    makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    )

    ros_depends=()
    depends=(${ros_depends[@]}
    )
    
    # Tarball version (faster download)
    _dir="serial-release-release-melodic-serial"
    source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/wjwwood/serial-release/archive/release/melodic/serial/${pkgver}.tar.gz")
    sha256sums=('3591de6b9035a647e0c3050109fb7d342681742e617bbf0e8f3d828e21b84c0f')

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
    