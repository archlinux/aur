# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Nathan Osman <nathan@quickmediasolutions.com>

pkgname=qmdnsengine
pkgver=0.2.1
pkgrel=1
pkgdesc='Simple multicast DNS library for Qt'
arch=('x86_64')
url='https://github.com/nitroshare/qmdnsengine'
license=('MIT')
depends=('qt5-base')
makedepends=('cmake' 'ninja')
source=("https://github.com/nitroshare/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('36f809a30b9647dfe29174bc61bf0d499925e96dc4f83a858beda0c7fb9372d8')

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
