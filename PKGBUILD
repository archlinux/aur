pkgname=nsnotifyd
pkgver=2.2
pkgrel=1
pkgdesc="DNS NOTIFY message handler"
arch=(i686 x86_64)
url="https://dotat.at/prog/nsnotifyd/"
license=(custom:CC0)
optdepends=("nsdiff: for the 'nsnotify2update' handler")
provides=(metazone=$pkgver)
source=("https://dotat.at/prog/nsnotifyd/nsnotifyd-${pkgver}.tar.gz")
sha256sums=('c92399179d9f19c79b8c1d738a552d2ca5530e22a6781bffcc9cd46d11ab8da4')

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
