pkgname=nsnotifyd
pkgver=2.3
pkgrel=1
pkgdesc="DNS NOTIFY message handler"
arch=(i686 x86_64)
url="https://dotat.at/prog/nsnotifyd/"
license=(custom:CC0)
optdepends=("nsdiff: for the 'nsnotify2update' handler")
provides=(metazone=$pkgver)
source=("https://dotat.at/prog/nsnotifyd/nsnotifyd-${pkgver}.tar.gz"
        "https://ftp.isc.org/isc/libbind/cur/libbind-6.0.tar.gz")
sha256sums=('8f9a61f5e5564cbed3a30ad4755539f2e0d4e22421efad1b7acf98259c52ae7e'
            'b98b6aa6e7c403f5a6522ffb68325785a87ea8b13377ada8ba87953a3e8cb29d')

prepare() {
  cd $pkgname-$pkgver
  ln -sf ../libbind-6.0.tar.gz
  sed -i '/^CFLAGS/d' Makefile.in
}

build() {
  cd $pkgname-$pkgver
  ./configure
  make prefix=/usr
}

package() {
  cd $pkgname-$pkgver
  make prefix=/usr DESTDIR="$pkgdir" install
  install -m 755 metazone "$pkgdir"/usr/bin/metazone
}

# vim: ts=2:sw=2:et
