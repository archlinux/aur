# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=cloog
pkgver=0.18.5
pkgrel=1
pkgdesc="Library that generates loops for scanning polyhedra"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.bastoul.net/cloog/"
license=('GPL')
depends=('isl>=0.18' 'osl')
source=(https://github.com/periscop/cloog/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('48602a72aaec8e1dabc33ec0622739d3ad585b7f0ec480eebdc1d724822b7cfd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-isl=system --with-osl=system
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # There are certain race conditions on running the tests, so we restrict
  # it to one job (one CPU core).
  make -j1 check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir/ install
}
