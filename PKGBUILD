# Maintainer: Eisuke Kawashima <e DOT kawaschima+arch AT gmail DOT com>

pkgname=trexio
pkgver=2.6.1
pkgrel=1
arch=('x86_64')
url='https://github.com/TREX-CoE/trexio'
depends=('glibc' 'hdf5')
makedepends=('gcc-fortran')
license=('BSD-3-Clause')
pkgdesc='TREX I/O library'
source=("$url/releases/download/v$pkgver/trexio-$pkgver.tar.gz")
sha256sums=('c3694ec1528632a386a2af89199c75d70ecd45bfcc2ca1d4ccccbfa1308ad5fa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd $_
  ../configure --prefix=/usr
  make
}

check() {
  make -C "$srcdir/$pkgname-$pkgver/build" check
}

package() {
  make -C "$srcdir/$pkgname-$pkgver/build" install DESTDIR="$pkgdir"
  install -Dm644 "$srcdir/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
