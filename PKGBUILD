# Maintainer: Leandro <leandro@example.com>
pkgname=vix
pkgver=0.1.4
pkgrel=1
pkgdesc="vix - vi-like editor based on Plan 9's structural regular expressions"
arch=('x86_64')
url="https://github.com/lvitals/vix"
license=('ISC')
depends=('lua' 'libtermkey' 'ncurses')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lvitals/vix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3bbc134ca4d58aa8106aa16db0bae290f5e4b17c4eb52a84742c1cad65e4683f')

build() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
  # Assumes LICENSE is in the root of the source
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
