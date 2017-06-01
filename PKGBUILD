# Maintainer: McNoggins
pkgname=pagmo2
pkgver=2.3
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
sha512sums=('9c2e5bab47495ce1b03aae5c1bd4d617f9136feaf1854f29230690ffb7a30e675b21b3bc041c8e0bdd1988631d25b77324f7642f60f7cf4b32222339811f891f')

build() {

cd "${srcdir}/$pkgname-$pkgver"
  cmake  $ARMA64LIBDIR -DCMAKE_INSTALL_PREFIX:PATH=/usr .
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING.gpl3 "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.gpl3"
}
