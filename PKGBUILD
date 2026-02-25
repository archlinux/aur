# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot it>

pkgname='geant4-lend'
pkgver=2.0
pkgrel=1
pkgdesc="Low Energy Nuclear Data (LEND) for Geant4"
optdepends=('geant4')
url="http://geant4.cern.ch/"
arch=('x86_64')
options=('!emptydirs')
source=(
#  "ftp://gdo-nuclear.ucllnl.org/LEND_GND1.3/LEND_GND1.3_ENDF.BVII.1.tar.gz" #This is the 1.3 version, old link
  "https://cern.ch/geant4-data/datasets/LEND_GNDS${pkgver}_ENDF.BVII.1.tar.gz"
  "https://cern.ch/geant4-data/datasets/LEND_GNDS${pkgver}_ENDF.BVIII.0.tar.gz"
  "https://cern.ch/geant4-data/datasets/LEND_GNDS${pkgver}_ENDF.BVIII.1.tar.gz"
)
#sha256sums=('2b239f592b24cdf862b0505b762cf98e418e999223d9dcebcb4c613026a5ee0c')
md5sums=(
  '95ac8c938262e8193f3f7a4194269877'  #LEND_GNDS2.0_ENDF.BVII.1.tar.gz
  'fea4243f0c36cd6b3aa0cebcb4ea6bfc'  #LEND_GNDS2.0_ENDF.BVIII.0.tar.gz
  'df83080160425b2504a2cb9751b4556f'  #LEND_GNDS2.0_ENDF.BVIII.1.tar.gz
)

build() {
  echo "By default, this package sets the G4LENDDATA variable to ENDF.BVIII.1"
  echo "In case you need BVII.1 or BVIII.0, please overwrite it accordingly"

  cd $srcdir
  echo "export G4LENDDATA=/opt/Geant4/Libraries/LEND_GNDS${pkgver}_ENDF.BVIII.1" > LEND.sh
  echo "setenv G4LENDDATA /opt/Geant4/Libraries/LEND_GNDS${pkgver}_ENDF.BVIII.1" > LEND.csh
}

package() {
  cd $srcdir
  install -D -m755 LEND.sh $pkgdir/etc/profile.d/LEND.sh
  install -D -m755 LEND.csh $pkgdir/etc/profile.d/LEND.csh

  find LEND_GNDS${pkgver}_ENDF.BVII.1 -type f -exec install -D "{}" "$pkgdir/opt/Geant4/Libraries/{}" \;
  find LEND_GNDS${pkgver}_ENDF.BVIII.0 -type f -exec install -D "{}" "$pkgdir/opt/Geant4/Libraries/{}" \;
  find LEND_GNDS${pkgver}_ENDF.BVIII.1 -type f -exec install -D "{}" "$pkgdir/opt/Geant4/Libraries/{}" \;
}
