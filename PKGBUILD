# Maintainer: John Hamelink <john@johnhamelink.com>
pkgname=pg_rrule-git
pkgver=0.2.0
pkgrel=1
pkgdesc="RRULE data type for PostgreSQL"
url="https://github.com/petropavel13/pg_rrule"
arch=('i686' 'x86_64')
license=('MIT')
depends=('postgresql' 'libical')
makedepends=('git')
conflicts=()
provides=('pg_rrule')
source=('git://github.com/petropavel13/pg_rrule.git')
sha256sums=('SKIP')


build() {

  cd "${srcdir}/pg_rrule/src"

  msg "Making pg_rrule"
  qmake pg_rrule.pro
  make

}

package() {

  mkdir -p "${pkgdir}/usr/share/postgresql/extension/"
  mkdir -p "${pkgdir}/usr/share/licenses/$pkgname/"

  install -D "${srcdir}/pg_rrule/src/libpg_rrule.so" "${pkgdir}/usr/lib/postgresql/pg_rrule.so"
  install -D "${srcdir}/pg_rrule/pg_rrule.control" "${pkgdir}/usr/share/postgresql/extension/"
  install -D "${srcdir}/pg_rrule/sql/pg_rrule.sql" "${pkgdir}/usr/share/postgresql/extension/pg_rrule--0.2.0.sql"
  install -D "${srcdir}/pg_rrule/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"

}
