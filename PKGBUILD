# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot it>

pkgname='geant4-lend'
pkgver=1.3
pkgrel=3
pkgdesc="Low Energy Nuclear Data (LEND) for Geant4"
optdepends=('geant4')
url="http://geant4.cern.ch/"
arch=('x86_64')
options=('!emptydirs')
source=("ftp://gdo-nuclear.ucllnl.org/LEND_GND1.3/LEND_GND${pkgver}_ENDF.BVII.1.tar.gz")
sha256sums=('2b239f592b24cdf862b0505b762cf98e418e999223d9dcebcb4c613026a5ee0c')

build() {
  cd $srcdir
  echo "export G4LENDDATA=/opt/Geant4/Libraries/LEND_GND${pkgver}_ENDF.BVII.1" > LEND.sh
  echo "setenv G4LENDDATA /opt/Geant4/Libraries/LEND_GND${pkgver}_ENDF.BVII.1" > LEND.csh
}

package() {
  cd $srcdir
  install -D -m755 LEND.sh $pkgdir/etc/profile.d/LEND.sh
  install -D -m755 LEND.csh $pkgdir/etc/profile.d/LEND.csh
  find LEND_GND1.3_ENDF.BVII.1 -type f -exec install -D "{}" "$pkgdir/opt/Geant4/Libraries/{}" \;

  }
