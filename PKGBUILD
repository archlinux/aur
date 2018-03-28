# Maintainer: Ghabry <gabriel-aur mastergk de>

pkgname=rttr
pkgver=0.9.6
pkgrel=1
pkgdesc="C++ Reflection Library"
arch=('x86_64')
url="http://www.rttr.org/"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake')
source=("http://www.rttr.org/releases/rttr-$pkgver-src.tar.gz")
sha256sums=('f62caee43016489320f8a69145c9208cddd72e451ea95618bc26a49a4cd6c990')

prepare() {
  mkdir -p build-$pkgver

  cd $pkgname-$pkgver

  # Fix incorrect file permissions after install
  sed -i 's/PERMISSIONS OWNER_READ//' CMake/*.cmake
}

build () {
  cd build-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_EXAMPLES=OFF \
    -DBUILD_DOCUMENTATION=OFF -DBUILD_PACKAGE=OFF \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    ../$pkgname-$pkgver
  make
}

package () {
  cd build-$pkgver
  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 ../$pkgname-$pkgver/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
