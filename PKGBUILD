# Maintainer: Malacology <guoyizhang at malacology dot net>

pkgname=sfa-spa
pkgver=0.2.1
pkgrel=0
pkgdesc="A short peptide assembler for metagenomic data https://doi.org/10.1093/nar/gkt118"
arch=('x86_64')
url="https://sourceforge.net/projects/spa-assembler/"
license=('GPL3')
depends=(glibc seqan libdivsufsort boost-libs)
optdepends=(perl)
makedepends=(make boost)
source=("$pkgname-$pkgver::https://sourceforge.net/projects/spa-assembler/files/SFA-SPA%20source%20%2864%20bit%20linux%29/sfaspa-${pkgver}.tar.gz/download"
	"$pkgname.patch")
sha256sums=('24cd2ecd2fbdc2734e4bd8992f5216f2e938cfdd95ec1c6bd8298601e2006206'
            '373a6a471541fa061765484549907c60c5cc35ce3eb73de08b52d893def4ca3d')
prepare () {
  cd $srcdir/${pkgname//-/}-$pkgver
  patch -N -p1 -i $srcdir/$pkgname.patch
}

build () {
  cd $srcdir/${pkgname//-/}-$pkgver/src
  make
}

package() {
  cd $srcdir/${pkgname//-/}-$pkgver/src
for prog in part postfgs prespa rtran spa
do
  install -Dm 755 ${prog} $pkgdir/usr/bin/${prog}
done

  cd $srcdir/${pkgname//-/}-$pkgver/script
for perl_prog in $(ls *)
do 
  install -Dm 755 ${perl_prog} $pkgdir/usr/share/$pkgname/${perl_prog}
done
}
