pkgname=pg_amqp
pkgver=v0.4.1.r6.g240d477
pkgrel=1
pkgdesc="AMQP support for Postgres"
arch=('i686' 'x86_64')
url="https://github.com/omniti-labs/pg_amqp"
license=('BSD')
makedepends=('git')
depends=('llvm' 'postgresql')

source=('git+https://github.com/omniti-labs/pg_amqp.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make PG_CPPFLAGS=-Wno-error=implicit-int
}

package() {
  cd "$srcdir/$pkgname"
  # Overwrite INSTALL to fix
  # http://postgresql.1045698.n5.nabble.com/PostgreSQL-9-3-beta-breaks-some-extensions-quot-make-install-quot-td5755344.html
  make PREFIX=/usr DESTDIR="$pkgdir" INSTALL=/usr/lib/postgresql/pgxs/config/install-sh install
}
