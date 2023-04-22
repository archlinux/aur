# Maintainer: Thayne McCombs <astrothayne at gmail dot com>
pkgname=wev
pkgver=1.0.0
pkgrel=11
pkgdesc="tool for debugging wayland events, similar to xev"
url='https://git.sr.ht/~sircmpwn/wev'
license=(MIT)
arch=('i686' 'x86_64' 'aarch64')
depends=('wayland' 'libxkbcommon')
makedepends=('scdoc' 'wayland-protocols')
conflicts=('wev-git')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/wev/archive/$pkgver.tar.gz")
# The package checksum isn't stable, so skip the checksum
# since we download from https, the main risk here is if sourcehut changes the
# contents of the package archive
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  make CFLAGS="$CFLAGS $LDFLAGS"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr MANDIR=/usr/share/man install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
