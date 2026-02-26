# Maintainer: Leandro <leandro@example.com>
pkgname=vix
pkgver=0.1.1
pkgrel=1
pkgdesc="vix - vi-like editor based on Plan 9's structural regular expressions"
arch=('x86_64')
url="https://github.com/lvitals/vix"
license=('ISC')
depends=('lua' 'libtermkey' 'ncurses')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lvitals/vix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('48a5fc7e5c66f5542c4743860bab9ae0c0c4910e555c806b3154aeff9d8e2a4c')

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
