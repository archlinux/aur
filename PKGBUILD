# Maintainer: Malacology <guoyizhang at malacology dot net>

pkgname=classic-delta
pkgver=2.25g
pkgrel=0
pkgdesc="An Open Source System for Processing Taxonomic Descriptions https://doi.org/10.2307/1219595"
arch=('x86_64')
url="http://freedelta.sourceforge.net/"
#url="https://www.delta-intkey.com/"
license=('MPL2')
depends=(glibc)
makedepends=(gcc-fortran make)
source=("$pkgname-$pkgver::https://sourceforge.net/projects/freedelta/files/classic_delta/Deltagfortran${pkgver}.zip/download"
	"classic-delta.patch")
sha256sums=('7ac822efe1c6b0b3bdea3c0f21c648efa63171d9f4ee49d77e594f996917d5d8'
            '5433d651ec6ff9e62d878a681c985056eb33aedcd559122cbb5427c50dfa75e5')
prepare () {
  cd $srcdir
  patch -N -p1 -i $srcdir/classic-delta.patch

for prog in Confor Dist Key
do
  cd $srcdir/$prog
  rm ${prog,,}
done

}
build () {
for prog in Confor Dist Key
do
  cd $srcdir/$prog
  make
done
}
package() {
for prog in Confor Dist Key
do
  cd $srcdir/$prog
  install -Dm 755 ${prog,,} $pkgdir/usr/bin/${prog,,}
done
}
