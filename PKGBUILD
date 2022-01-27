pkgname=nsnotifyd
pkgver=2.0
pkgrel=2
pkgdesc="DNS NOTIFY message handler"
arch=(i686 x86_64)
url="https://dotat.at/prog/nsnotifyd/"
license=(custom:CC0)
optdepends=("nsdiff: for the 'nsnotify2update' handler")
provides=(metazone=$pkgver)
source=("https://dotat.at/prog/nsnotifyd/nsnotifyd-${pkgver}.tar.gz")
sha256sums=('65b96065e653cbfe66400950bd0c05c7ba61b0ca7b3b13153c4a95038a5e90de')

build() {
  cd $pkgname-$pkgver
  sed -i '/^CFLAGS/d' Makefile.in
  ./configure
  make prefix=/usr
}

package() {
  cd $pkgname-$pkgver
  make prefix=/usr DESTDIR="$pkgdir" install
  install -m 755 metazone "$pkgdir"/usr/bin/metazone
}

# vim: ts=2:sw=2:et
