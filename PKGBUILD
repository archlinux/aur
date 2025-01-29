# Maintainer: LS-Shandong <ls-shandong@outlook.com>

pkgname=guile-dbd-mysql
pkgver=2.1.9
pkgrel=2
pkgdesc='The dbd plugin connects to an actual MySQL database server'
arch=('x86_64' 'aarch64')
url='https://github.com/opencog/guile-dbi'
license=('GPL2')
pkgdepend=guile-dbi
depends=('guile' 'guile-dbi' 'mysql')
source=("${url}/archive/${pkgdepend}-${pkgver}.tar.gz")
sha256sums=('25C38FE7E7176B4340951093FCBD13A9E6532D76399310CB6DF19E169EC19347')
options=(!strip)

build () {
  cd "${srcdir}/${pkgdepend}-${pkgdepend}-$pkgver/${pkgname}"
  sed -i 's/#include <mariadb\/mysql.h>/#include <mysql\/mysql.h>/g' src/guile-dbd-mysql.c
  sed -i 's/#include <mariadb\/errmsg.h>/#include <mysql\/errmsg.h>/g' src/guile-dbd-mysql.c
  ./autogen.sh --no-configure
  ./configure --prefix=/usr
  make
}

package () {
  cd "${srcdir}/${pkgdepend}-${pkgdepend}-$pkgver/${pkgname}"
  make DESTDIR="$pkgdir" install
}
