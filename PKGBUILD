pkgname='postgresql-musicbrainz-collate'
pkgver=v1.0.0.r7.g583f801
pkgrel=1
pkgdesc="MusicBrainz' collate extension to PostgreSQL"
arch=('i686' 'x86_64')
url=("http://musicbrainz.org/doc/MusicBrainz_Server")
license=('GPL')
depends=('postgresql')

source=('git+https://github.com/metabrainz/postgresql-musicbrainz-collate')
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
