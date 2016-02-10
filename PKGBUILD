# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: Lucas Hermann Negri <lucashnegri at gmail dot com>

pkgname=armadillo
pkgver=6.500.5
pkgrel=1
pkgdesc="C++ linear algebra library"
arch=('i686' 'x86_64')
url="http://arma.sourceforge.net/"
license=('MPL 2.0')
depends=('lapack' 'blas' 'arpack' 'superlu=4.3')
optdepends=('hdf5: HDF5 output'
            'cuda: NVBLAS support'
	    'acml-cblas: ACML support')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/sourceforge/arma/$pkgname-$pkgver.tar.gz")
install=armadillo.install
sha512sums=('d56d6bac80a9c7ec8ab9812ab25ebbc74536b7760d96f5c58282372a1a01648fe8d2400d6ce61148a5b0afaf80dc74a571f94a7814fbe493991b4fb3c9cdf648')

build() {
  if [ "$CARCH" == "x86_64" ]; then
    ARMA64LIBDIR="-DINSTALL_LIB_DIR:PATH=/usr/lib"
  fi

  cd "${srcdir}/$pkgname-$pkgver"
  cmake  $ARMA64LIBDIR -DCMAKE_INSTALL_PREFIX:PATH=/usr .
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
      
