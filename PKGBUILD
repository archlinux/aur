# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: Lucas Hermann Negri <lucashnegri at gmail dot com>

pkgname=armadillo
pkgver=5.200.1
pkgrel=1
pkgdesc="C++ linear algebra library"
arch=('i686' 'x86_64')
url="http://arma.sourceforge.net/"
license=('MPL 2.0')
depends=('lapack' 'blas' 'arpack' 'superlu=4.3')
optdepends=('hdf5: HDF5 output')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/sourceforge/arma/$pkgname-$pkgver.tar.gz")
install=("armadillo.install")
sha512sums=('750e18a7c464bfe17ed113014312cce54793780d2c5d1f6510faaedac44bc6c055955b0ffba6884ab1111be5c22740a0b3ddcd9533caf51afe1bda33074177f4')

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
      
