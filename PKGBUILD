# Script generated with create_pkgbuild.py
    # For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
    pkgdesc="ROS - Interactive control for generic Twist-based robots using interactive markers."
    url='h'

    pkgname='ros-melodic-interactive-marker-twist-server'
    pkgver='1.2.0'
    arch=('any')
    pkgrel=2
    license=('BSD')

    ros_makedepends=(ros-melodic-interactive-markers
  ros-melodic-visualization-msgs
  ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-roslint
  )
    makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    )

    ros_depends=(ros-melodic-interactive-markers
  ros-melodic-visualization-msgs
  ros-melodic-roscpp)
    depends=(${ros_depends[@]}
    )

    # Tarball version (faster download)
_dir="interactive_marker_twist_server-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/interactive_marker_twist_server/archive/${pkgver}.tar.gz")
sha256sums=('00fda96ab6adf73e8f61299334443a00a9d1eb00ff0727fe49dea6c6189bf889')


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
                -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 \
                -DPYTHON_LIBRARY=/usr/lib/libpython3.8.so \
                -DPYTHON_BASENAME=.cpython-38m \
                -DSETUPTOOLS_DEB_LAYOUT=OFF
    make
    }

    package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
    }
    
