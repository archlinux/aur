# Maintainer: Timo Sarawinski <t.sarawinski@gmail.com>
# Original Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=cloog-isl15
_origpkgname=cloog
pkgver=0.18.4
pkgrel=2
pkgdesc="Library that generates loops for scanning polyhedra"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.bastoul.net/cloog/"
license=('GPL')
depends=('isl15')
source=(http://www.bastoul.net/cloog/pages/download/$_origpkgname-$pkgver.tar.gz)
md5sums=('e531f725244856c92c9bba009ff44faf')

build() {
  cd "${srcdir}/${_origpkgname}-${pkgver}"
  ./configure --prefix=/usr --with-isl=system
  make
}

check() {
  cd "${srcdir}/${_origpkgname}-${pkgver}"
  # There are certain race conditions on running the tests, so we restrict
  # it to one job (one CPU core).
  make -j1 check
}

package() {
  cd "${srcdir}/${_origpkgname}-${pkgver}"
  make DESTDIR=$pkgdir/ install
}
