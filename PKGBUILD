# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=libpreludedb
pkgver=3.0.0
pkgrel=1
pkgdesc="Framework to easy access to the Prelude database"
arch=('i686' 'x86_64')
url="http://www.prelude-siem.org"
license=('GPLv2')
makedepends=('libmariadbclient' 'postgresql-libs' 'sqlite')
depends=('gnutls' 'python2' 'python3' 'gtk-doc' 'libprelude')
optdepends=('sqlite: SQLite support'
            'mariadb: MariaDB support'
            'postgresql: PostgreSQL support')
source=("https://www.prelude-siem.org/pkg/src/3.0.0/$pkgname-$pkgver.tar.gz"
        "python_swig.patch")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CPP="cpp -P" ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	      --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

prepare() {
  patch -p0 <python_swig.patch
}

md5sums=('6a2f51d8cd74068f741a89341bf1ba95' 'e1b39c2277e3e8c4ea36a23ceffdb21a')
