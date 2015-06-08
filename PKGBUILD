pkgname='postgresql-musicbrainz-unaccent'
pkgver=v1.0.0.r0.gdb45982
pkgrel=1
pkgdesc="MusicBrainz' unaccent extension to PostgreSQL"
arch=('i686' 'x86_64')
url=("http://musicbrainz.org/doc/MusicBrainz_Server")
license=('GPL')
depends=('postgresql' 'icu')

source=('git+https://github.com/metabrainz/postgresql-musicbrainz-unaccent')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  # Overwrite INSTALL to fix
  # http://postgresql.1045698.n5.nabble.com/PostgreSQL-9-3-beta-breaks-some-extensions-quot-make-install-quot-td5755344.html
  make PREFIX=/usr DESTDIR="$pkgdir" INSTALL=/usr/lib/postgresql/pgxs/config/install-sh install
}
