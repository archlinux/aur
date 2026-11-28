# Maintainer: Fabian Brosda <fabi3141@gmx.de>
# Maintainer: LS-Shandong <ls-shandong@outlook.com>

pkgname=guile-dbd-mysql
pkgver=3.3.0
pkgrel=1
pkgdesc='The dbd plugin connects to an actual MySQL database server'
arch=('x86_64' 'aarch64')
url='https://github.com/opencog/guile-dbi'
license=('GPL-2.0-only')
pkgdepend=guile-dbi
depends=('guile' 'guile-dbi' 'mysql')
makedepends=('libtool')
source=("${url}/archive/${pkgdepend}-${pkgver}.tar.gz")
sha256sums=('af92ca21240eda178da8528ba8b77dd2245813d1bef524d6015b5f6519df800b')
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
