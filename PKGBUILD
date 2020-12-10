# Script generated with create_pkgbuild.py
    # For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
    pkgdesc="ROS - The libg2o library from http://openslam.org/g2o.html."
    url='https://github.com/RainerKuemmerle/g2o'

    pkgname='ros-melodic-libg2o'
    pkgver='2018.3.25'
    arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
    pkgrel=4
    license=('BSD')

    ros_makedepends=()
    makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    eigen
    glu
  boost1.69
  mesa
  suitesparse)

    ros_depends=(ros-melodic-catkin)
    depends=(${ros_depends[@]}
    eigen
    glu
  boost1.69
  mesa
  suitesparse)
    
    # Tarball version (faster download)
    _dir="libg2o-release-release-melodic-libg2o"
    source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-gbp/libg2o-release/archive/release/melodic/libg2o/${pkgver}.tar.gz")
sha256sums=('c49b69b1843dc0c287720c1eb14380069612abe5f338c5f979a7099f6dde6db3')

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
                -DSETUPTOOLS_DEB_LAYOUT=OFF \
		 -DBOOST_ROOT=/opt/boost1.69
    make
    }

    package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
    }
    
