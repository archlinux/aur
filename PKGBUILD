# Maintainer: McNoggins
pkgname=pagmo2
pkgver=2.4
pkgrel=1
pkgdesc="Perform parallel computations of optimisation tasks (global and local) via the asynchronous generalized island model (version 2)"
arch=('any')
url="https://github.com/esa/pagmo2"
license=('GPLv3')
depends=('boost')
optdepends=('gsl: Mathematical operations (symbolic)'
	    'blas: GSL CBLAS functions'
	    'nlopt: Nonlinear optimization algorithms'
	    'python: PyGMO support')
makedepends=('cmake')
source=(https://github.com/esa/pagmo2/archive/v${pkgver}.tar.gz)
sha512sums=('a89c460841076cbd9de38b04bf4e9ed7d4f2a9ab0948011ba550c83c2bd909f35c042d7a05920ba5291f8004edaef40eb54ca461a1bdb9f2800ba3fbcc32946f')

build() {

cd "${srcdir}/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING.gpl3 "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.gpl3"
}
