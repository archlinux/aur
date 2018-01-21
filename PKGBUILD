# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgbase=sweep-sdk
pkgname=(libsweep)
pkgver=1.3.0
pkgrel=1
pkgdesc="Scanse Sweep LiDAR SDK"
url="https://github.com/scanse/sweep-sdk"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/scanse/$pkgbase/archive/v$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgbase-$pkgver/libsweep"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr
  cmake --build .
}

package_libsweep() {
  cd "$srcdir/$pkgbase-$pkgver/libsweep/build"
  DESTDIR="${pkgdir}" cmake --build . --target install
  install -Dm644 ../../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('30b51a9f68ec64684648b54e0d704da7e38a5a0f42a6bc965f3e33f4e3a80af0')
