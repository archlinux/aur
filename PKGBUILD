# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Nathan Osman <nathan@quickmediasolutions.com>

pkgname=qmdnsengine
pkgver=0.1.0
pkgrel=2
pkgdesc='Simple multicast DNS library for Qt'
arch=('x86_64')
url='https://github.com/nitroshare/qmdnsengine'
license=('MIT')
depends=('qt5-base')
makedepends=('cmake' 'ninja')
source=("https://github.com/nitroshare/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('27416ca7b8b8a8588df4318de57127ef97e1205269fa506f00f21b09d30d3ac2')

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
