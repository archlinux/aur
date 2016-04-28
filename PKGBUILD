# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=FeynHiggs
pkgname=feynhiggs
pkgver=2.11.3
pkgrel=4
pkgdesc="FeynHiggs is a Fortran code for the (diagrammatic) calculation of the masses, mixings and much more of the Higgs bosons in the MSSM with real/complex parameters at the highest level of accuracy."
arch=("i686" "x86_64")
url="http://wwwth.mpp.mpg.de/members/heinemey/feynhiggs/cFeynHiggs.html"
license=('GPL')
depends=("gcc-fortran")
source=("http://wwwth.mpp.mpg.de/members/heinemey/feynhiggs/newversion/${_pkgname}-$pkgver.tar.gz")
sha256sums=('570746c34efbbfba45b39ea7110b0069354747138ad149204f09819548b87f6a')

build() {
  cd "${_pkgname}-$pkgver"
  ./configure --prefix=/usr --enable-full-g-2 --enable-slhapara
  sed -i 's/LIBDIR = $(PREFIX)\/lib$(LIBDIRSUFFIX)/LIBDIR = $(PREFIX)\/lib/g' makefile
  sed -i 's/-mkdir/-mkdir -p/g' makefile
  make
}

package() {
  cd "${_pkgname}-$pkgver"
  make PREFIX="$pkgdir/usr" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  cd $pkgdir/usr/bin; mv fcc fcc-feynhiggs; mv table table-feynhiggs
  cd $pkgdir/usr/include; mkdir -p FeynHiggs; mv *.h FeynHiggs
}
