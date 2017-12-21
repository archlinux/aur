# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Generate the type support for C messages."
url='http://www.ros.org/'

pkgname='ros-ardent-rosidl-typesupport-c'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=(ros-ardent-ament-cmake)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-rmw-implementation
  ros-ardent-rosidl-typesupport-introspection-c
  ros-ardent-rosidl-typesupport-interface
  ros-ardent-rosidl-generator-c
  ros-ardent-rosidl-typesupport-opensplice-c
  ros-ardent-poco-vendor
  ros-ardent-ament-cmake-core)
depends=(${ros_depends[@]}
  poco)

# Git version (e.g. for debugging)
# _tag=release/ardent/rosidl_typesupport_c/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/rosidl_typesupport-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rosidl_typesupport-release-release-ardent-rosidl_typesupport_c-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/rosidl_typesupport-release/archive/release/ardent/rosidl_typesupport_c/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('d0e6e02da09173d68c418b01c42411479aa7d11bde95f34a75516ba1c336eb75')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/ardent/setup.bash ] && source /opt/ros/ardent/setup.bash

  # Create build directory
  [ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 "${srcdir}/${_dir}"

  export PYTHONPATH=/opt/ros/ardent/lib/python3.6/site-packages
  export AMENT_PREFIX_PATH=/opt/ros/ardent

  # Build project
  cmake "${srcdir}/${_dir}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=Off \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/ardent
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
