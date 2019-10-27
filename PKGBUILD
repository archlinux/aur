# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=libpreludedb
pkgver=5.1.0
pkgrel=1
pkgdesc="Framework to easy access to the Prelude database"
arch=('i686' 'x86_64')
url="https://www.prelude-siem.org"
license=('GPLv2')
makedepends=('libmariadbclient' 'postgresql-libs' 'sqlite')
depends=('gnutls' 'python2' 'python3' 'gtk-doc' 'libprelude')
optdepends=('sqlite: SQLite support'
            'mariadb: MariaDB support'
            'postgresql: PostgreSQL support')
source=("https://www.prelude-siem.org/pkg/src/5.1.0/$pkgname-$pkgver.tar.gz"
        "libpreludedb-5.1.0-fix_gtkdoc_1.32.patch"
        "libpreludedb-5.1.0-fix_py38.patch"
        "libpreludedb-5.1.0-update_m4_postgresql.patch"
        )

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CPP="cpp -P" ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

md5sums=('372b2e7b40e1cc451833370e19bb4ec7' 'c7dcc36dea18613273437ba7114509b8' 'e76d6a5a75e312a235b15f8dd4d13110' '5a643e0b78a60505c24e84e2696000ad')
