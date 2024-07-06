# Maintainer: Kino <cybao292261@163.com>

_pkgroot=vision_opencv
_pkgname=image_geometry
pkgname=ros2-humble-image-geometry
pkgver=3.2.1
pkgrel=2
pkgdesc="This contains collection of methods for dealing with image and pixel geometry."
url="https://index.ros.org/p/image_geometry/"
license=('Apache-2.0' 'BSD-3-Clause')
arch=('any')
makedepends=('cmake')
depends=('opencv' 'ros2-humble')
checkdepends=('gtest' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ros-perception/vision_opencv/archive/${pkgver}.tar.gz")
sha256sums=('bf8a18770ffe3335e9bf96cb89be886a846be10382e67c2dc93cd4e387b2c3f9')

build() {
  cmake -B build -S "$_pkgroot-$pkgver/$_pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
  cmake --build build
}

check() {
  export LD_LIBRARY_PATH=$srcdir/build
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $srcdir/$_pkgroot-$pkgver/LICENSE-Apache $pkgdir/usr/share/licenses/$pkgname/LICENSE-Apache
  install -Dm644 $srcdir/$_pkgroot-$pkgver/LICENSE-BSD $pkgdir/usr/share/licenses/$pkgname/LICENSE-BSD
}
