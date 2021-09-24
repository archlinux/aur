# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=GM2Calc
pkgname=gm2calc
pkgver=1.7.5
pkgrel=1
pkgdesc="A C++ program which calculates the anomalous magnetic moment of the muon in the MSSM at 1-loop and leading 2-loop order."
arch=("x86_64")
url="http://gm2calc.hepforge.org"
license=('GPL3')
makedepends=("cmake")
depends=("boost" "eigen")
source=("https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5b44b3d51c763238a1f53845c10559c0a8c9a88e524377d698d2c2306b117a7f')

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
