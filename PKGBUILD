# Maintainer: Chan Beom Park <cbpark@gmail.com>

pkgname=gm2calc
pkgver=1.3.2
pkgrel=1
pkgdesc="A C++ program which calculates the anomalous magnetic moment of the muon in the MSSM at 1-loop and leading 2-loop order."
arch=("i686" "x86_64")
url="http://gm2calc.hepforge.org"
license=('GPL3')
depends=("boost>=1.37.0" "eigen>=3.1")
source=("http://www.hepforge.org/archive/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('93c3f53ce2e0e147c21c7b097ae08090a22492c5bb282eaeacccb5df05847591')

build() {
  cd "$pkgname-$pkgver"
  make ${MAKEFLAGS}
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p $pkgdir/usr/bin
  mv bin/fcc $pkgdir/usr/bin/fcc-gm2calc
  mv bin/mcc $pkgdir/usr/bin/mcc-gm2calc
  mv bin/gm2calc.x $pkgdir/usr/bin

  mkdir -p $pkgdir/usr/include/GM2Calc
  mv src/gm2_1loop.hpp src/gm2_2loop.hpp src/gm2_uncertainty.hpp src/MSSMNoFV_onshell.hpp \
     $pkgdir/usr/include/GM2Calc
  mv src/gm2_1loop.h src/gm2_2loop.h src/gm2_uncertainty.h src/MSSMNoFV_onshell.h \
     $pkgdir/usr/include/GM2Calc

  mkdir -p $pkgdir/usr/lib
  mv src/libgm2calc.so $pkgdir/usr/lib
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
