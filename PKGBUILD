# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=LoopTools
pkgname=looptools
pkgver=2.13
pkgrel=6
pkgdesc="package for evaluation of scalar and tensor one-loop integrals"
arch=("i686" "x86_64")
url="http://www.feynarts.de/looptools"
license=('GPL3')
depends=("gcc-fortran")
options=('staticlibs')
source=("http://www.feynarts.de/looptools/${_pkgname}-$pkgver.tar.gz")
sha256sums=('6dd3fb654832874e4703048e1715b677afd43e782abe6ba5a18d6624d9a0e6ec')

build() {
  cd "${_pkgname}-$pkgver"
  ./configure --prefix=/usr
  sed -i 's/LIBDIR = $(PREFIX)\/lib$(LIBDIRSUFFIX)/LIBDIR = $(PREFIX)\/lib/' makefile
  make
}

package() {
  cd "${_pkgname}-$pkgver"
  make PREFIX="$pkgdir/usr" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  cd $pkgdir/usr/bin
  mv fcc fcc-looptools; rm -f f++; ln -sf fcc-looptools f++-looptools
}
