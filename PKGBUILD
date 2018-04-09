# Maintainer: Josh Marshall <jrmarsha@mtu.edu>

pkgname=fingerprintscan
pkgver='3.5.96'
pkgrel=2
pkgdesc='Search against FingerPRINTScan with a protein query sequence to identify the closest matching PRINTS sequence motif fingerprints in a protein sequence.'
arch=('x86_64')
license=('LGPL')
url='http://130.88.97.239/PRINTS/index.php'
depends=('gcc-libs')
makedepends=('gcc-libs')
provides=()
source=(
	fingerprintscan.tgz
)
sha512sums=(
'ad5a195b5900fee4df72341fed6a16fa0c1bcdfb6b01d7c16f070e527a9a11b49086357c0dac79a5b88b3edc810279cacaaffe3cc9387ad09498e27ae05dd682'
)


build() {
  cd "$pkgname"

  sed 's/shuffle/ShuffleFlag/g' FingerPrint.cc > FingerPrint.cc.tmp
  mv FingerPrint.cc.tmp FingerPrint.cc
  ./configure --exec-prefix=/usr --prefix=/usr  
  make
}

package() {  
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
