# Maintainer: Chan Beom Park <cbpark@gmail.com>

pkgname=softsusy
pkgver=4.0
pkgrel=1
pkgdesc="This program provides a SUSY spectrum in the NMSSM, or the MSSM including flavour violation and with or without R-parity consistent with input Standard Model fermion mass/mixings and electroweak/strong coupling data."
arch=("i686" "x86_64")
url="http://softsusy.hepforge.org"
license=('GPL')
depends=("gcc-fortran" "looptools")
source=("http://www.hepforge.org/archive/softsusy/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7f9b35e33ab330d279c33e1604a11cfba2a4b7503a2d0197d58de7d4239ec9cf')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --enable-looptools --prefix=/usr
  MAKEFLAGS=-j1 make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
