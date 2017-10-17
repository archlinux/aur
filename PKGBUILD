pkgname=pgindent
pkgver=9.6.5
_majorver=${pkgver%.*}
pkgrel=1
pkgdesc="Postgresql code indenter"
arch=('i686' 'x86_64')
url="http://www.postgresql.org/"
license=('custom:PostgreSQL')
depends=('pg-bsd-indent')
source=(http://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
       )
sha256sums=(06da12a7e3dddeb803962af8309fa06da9d6989f49e22865335f0a14bad0744c
           )

build() {
  cd "${srcdir}/postgresql-${pkgver}"/src/tools/entab
  make
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/local/etc/"

  cd "${srcdir}/postgresql-${pkgver}"/src/tools/entab
  make BINDIR="${pkgdir}/usr/bin" install
  
  cd "${srcdir}/postgresql-${pkgver}"/src/tools/pgindent
  install -m755 pgindent "${pkgdir}/usr/bin/pgindent"
  install -m755 pgcppindent "${pkgdir}/usr/bin/pgcppindent"
  install -m644 typedefs.list "${pkgdir}/usr/local/etc/typedefs.list"
}
