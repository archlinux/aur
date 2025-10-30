# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: Lucas Hermann Negri <lucashnegri at gmail dot com>
pkgname=armadillo
pkgver=15.2.1
_pkgver=${pkgver/_/-} # For use with RC releases, to replace the _ with -
pkgrel=1
pkgdesc="C++ linear algebra library"
arch=('i686' 'x86_64')
url="http://arma.sourceforge.net/"
license=('Apache')
depends=('lapack' 'blas' 'arpack' 'superlu>=5.2.0')
optdepends=('hdf5: HDF5 output'
            'intel-oneapi-mkl: Intel Math Kernel Library support')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/sourceforge/arma/$pkgname-$_pkgver.tar.xz")
install=armadillo.install
sha512sums=('dba9a42738a476492e4f5580f43feafa4226d11325e540e19c3730f9723d0a4676ba4a4be6a49beb340e62127426b946388634ce724cb008da3debf06d3d75f9')

build() {
  if [ "$CARCH" == "x86_64" ]; then
    ARMA64LIBDIR="-DINSTALL_LIB_DIR:PATH=/usr/lib"
  fi

  cd "${srcdir}/$pkgname-$_pkgver"
  cmake $ARMA64LIBDIR -DCMAKE_INSTALL_PREFIX:PATH=/usr .
  make
}

package() {
  cd "${srcdir}/$pkgname-$_pkgver"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
