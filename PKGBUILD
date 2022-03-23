# Maintainer: Thayne McCombs <astrothayne at gmail dot com>
pkgname=wev
pkgver=1.0.0
pkgrel=7
pkgdesc="tool for debugging wayland events, similar to xev"
url='https://git.sr.ht/~sircmpwn/wev'
license=(MIT)
arch=('i686' 'x86_64' 'aarch64')
depends=('wayland' 'libxkbcommon')
makedepends=('scdoc' 'wayland-protocols')
conflicts=('wev-git')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/wev/archive/$pkgver.tar.gz")
b2sums=('e777cf1f19a5ad051b81ccd878067ba043c5121f460aed26fa41c999812d9c52e30837cbcb72351de4e532f0427cb2e8f707ca1ddaa09d992cdff3c422638ec2')

build() {
  cd "$pkgname-$pkgver"
  make CFLAGS="$CFLAGS $LDFLAGS"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr MANDIR=/usr/share/man install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
