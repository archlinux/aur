# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=cloog
pkgver=0.19.0
pkgrel=1
pkgdesc="Library that generates loops for scanning polyhedra"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.bastoul.net/cloog/"
license=('GPL')
depends=('osl' 'isl')
makedepends=('texlive-core' 'texlive-bin')
source=(https://github.com/periscop/cloog/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('a0646f31e7a2c1809c51b812f58dc3f733f3a7c4cdf84fa5fee4ed7a372b7bf649561c7eceb7bfc754f1aca519ec0fc3718e08775e7eb072a238ce341edda10a')

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
