pkgname=pgindent
pkgver=9.4.4
_majorver=${pkgver%.*}
pkgrel=1
pkgdesc="Postgresql code indenter"
arch=('i686' 'x86_64')
url="http://www.postgresql.org/"
license=('custom:PostgreSQL')
depends=('pg-bsd-indent')
source=(http://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
       )
md5sums=('1fe952c44ed26d7e6a335cf991a9c1c6'
        )
sha256sums=('538ed99688d6fdbec6fd166d1779cf4588bf2f16c52304e5ef29f904c43b0013'
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
