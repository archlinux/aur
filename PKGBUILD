# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=GM2Calc
pkgname=gm2calc
pkgver=1.5.0
pkgrel=1
pkgdesc="A C++ program which calculates the anomalous magnetic moment of the muon in the MSSM at 1-loop and leading 2-loop order."
arch=("i686" "x86_64")
url="http://gm2calc.hepforge.org"
license=('GPL3')
makedepends=("cmake")
depends=("boost" "eigen")
source=("https://${pkgname}.hepforge.org/downloads/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e099211bf9f4f6d75f467351059d5ee4bd567998fcecc6aacdfbd79ee48e35a6')

build() {
  cd "${_pkgname}-${pkgver}"

  mkdir -p build
  cd build
  cmake ..
  make ${MAKEFLAGS}
}

package() {
  cd "${_pkgname}-${pkgver}"

  cd build
  make DESTDIR="$pkgdir" install
  cd ..
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
