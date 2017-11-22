# Maintainer: McNoggins
pkgname=pagmo2
pkgver=2.6
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
sha512sums=('fb6d3b3bc5b0d34ea630be4517c3587f0aeb47ba46bfaf8b6926612fef04295b164d4f9a930a468a0251220e8f886a6cfa483f52b1ef542f29c431932801291d')

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
