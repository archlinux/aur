# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Nathan Osman <nathan@quickmediasolutions.com>

pkgname=qhttpengine
pkgver=1.0.1
pkgrel=4
pkgdesc='Simple and secure HTTP server for Qt'
arch=('x86_64')
url='https://github.com/nitroshare/qhttpengine'
license=('MIT')
depends=('qt5-base')
makedepends=('cmake' 'ninja')
source=("https://github.com/nitroshare/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6505cf889909dc29bab4069116656e7ca5a9e879f04935139439c5691a76c55e')

build() {
  cmake -S $pkgname-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr' -DBUILD_TESTS=ON
  cmake --build build
}

check(){
  ctest --test-dir build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname-$pkgver/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
