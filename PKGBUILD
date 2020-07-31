# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=GM2Calc
pkgname=gm2calc
pkgver=1.7.0
pkgrel=1
pkgdesc="A C++ program which calculates the anomalous magnetic moment of the muon in the MSSM at 1-loop and leading 2-loop order."
arch=("x86_64")
url="http://gm2calc.hepforge.org"
license=('GPL3')
makedepends=("cmake")
depends=("boost" "eigen")
source=("https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('84856c92ab2785f1959abb747f06e3ac18bcdb3b35d1c85b9b362152c7660bd4')

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
