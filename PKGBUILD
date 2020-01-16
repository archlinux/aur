# Script generated with create_pkgbuild.py
    # For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
    pkgdesc="ROS - The move_base_flex messages package providing the action definition files for the action GetPath, ExePath, Recovery and MoveBase."
    url='http://www.ros.org/'

    pkgname='ros-melodic-mbf-msgs'
    pkgver='0.2.5'
    arch=('any')
    pkgrel=1
    license=('3-Clause BSD')

    ros_makedepends=(ros-melodic-message-generation
  ros-melodic-nav-msgs
  ros-melodic-message-runtime
  ros-melodic-genmsg
  ros-melodic-geometry-msgs
  ros-melodic-std-msgs
  ros-melodic-actionlib-msgs
  ros-melodic-catkin)
    makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    )

    ros_depends=(ros-melodic-nav-msgs
  ros-melodic-message-runtime
  ros-melodic-geometry-msgs
  ros-melodic-std-msgs
  ros-melodic-actionlib-msgs)
    depends=(${ros_depends[@]}
    )
    
    # Tarball version (faster download)
    _dir="move_base_flex-release-release-melodic-mbf_msgs"
    source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/uos-gbp/move_base_flex-release/archive/release/melodic/mbf_msgs/${pkgver}.tar.gz")
    sha256sums=('603939164770a585198e17467e10dd17862d11a7f1ec7af8dbdee5041d29f027')

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
    