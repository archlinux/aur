# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>

pkgname=tunics
pkgver=0.3
pkgrel=1
pkgdesc="Roguelike-like Zelda game for the Solarus engine"
arch=('any')
url="https://tunics.legofarmen.se/"
license=('GPL3' 'MIT' 'custom')
depends=('solarus>=1.5.0')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Legofarmen/$pkgname/archive/$pkgver.tar.gz")
b2sums=('8f92a0cade4c02ccc9c785ddb7209c98ce33a050c8f086457d4fa6a6b024c374d03eeb89a320f60cf6b72a4414ab75df98d7b469d75e5848f40e3434fcc6ba68')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i "s/echo 'solarus /echo 'solarus-run /" CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX="/usr" .
}

build() {
  make -C "$pkgname-$pkgver" ${MAKEFLAGS}
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 CREDITS.txt "$pkgdir/usr/share/licenses/$pkgname/CREDITS"
}


