# Maintainer: Kino <cybao292261 at 163 dot com>

_pkgname=pcl_ros
_metaname=perception_pcl
_distro=humble
pkgname="ros2-$_distro-${_pkgname/_/-}"
pkgver=2.4.3
pkgrel=1
pkgdesc="PCL-ROS is the preferred bridge for 3D applications involving n-D Point Clouds and 3D geometry processing in ROS."
url="https://index.ros.org/p/$_pkgname/"
license=("BSD-3-Clause")
arch=('any')
makedepends=('cmake')
depends=(
  "eigen"
  "pcl"
  "ros2-$_distro"
  "ros2-$_distro-pcl-conversions"
)
#checkdepends=('cppcheck' 'flake8' 'gtest' 'python-pydocstyle')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ros-perception/$_metaname/archive/$pkgver.tar.gz")
sha256sums=('a10707f096e8eb8d4c290c29739f35af2e50ae254d7cc56b91d868d50f8fc16e')

build() {
  source /opt/ros/$_distro/setup.bash

  cmake -B build -S $_metaname-$pkgver/$_pkgname \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/opt/ros/$_distro \
      -DBUILD_SHARED_LIBS=ON \
      -DBUILD_TESTING=ON \
      -Wno-dev

  cmake --build build
}

#check() {
#  ctest --test-dir build --output-on-failure
#}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
