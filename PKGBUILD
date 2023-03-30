# Maintainer: Thayne McCombs <astrothayne at gmail dot com>
pkgname=wev
pkgver=1.0.0
pkgrel=8
pkgdesc="tool for debugging wayland events, similar to xev"
url='https://git.sr.ht/~sircmpwn/wev'
license=(MIT)
arch=('i686' 'x86_64' 'aarch64')
depends=('wayland' 'libxkbcommon')
makedepends=('scdoc' 'wayland-protocols')
conflicts=('wev-git')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/wev/archive/$pkgver.tar.gz")
b2sums=('7a7d17575cf7d2e97bfd01f107cba6512d70f014fbf306c95fdd9e2424ff87dfaa628ba9f5b6883741ad0e4d702020de86535464941c967bd6098e451daaee6e')

build() {
  cd "$pkgname-$pkgver"
  make CFLAGS="$CFLAGS $LDFLAGS"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr MANDIR=/usr/share/man install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
