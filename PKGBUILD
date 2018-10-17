# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=sysbench-git
_pkgname=sysbench
pkgver=1.1.0.r1193.b04e5fd
pkgrel=2
pkgdesc='Multi-threaded benchmark for evaluating OS parameters for database-loads (git)'
arch=('x86_64' 'i686')
license=('GPL2')
url='https://github.com/akopytov/sysbench'
depends=('libmariadbclient' 'postgresql-libs')
makedepends=('git')
source=('git+https://github.com/akopytov/sysbench')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $( cat configure.ac | grep AC_INIT | sed 's|.*sysbench],\[||; s|].*||' ).r$( git rev-list --count HEAD ).$( git rev-parse --short HEAD )
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr --with-pgsql
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 README.md "${pkgdir}/usr/share/${_pkgname}/README.md"
}
