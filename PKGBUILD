# Maintainer: trya <tryagainprod@gmail.com>

_pkgbasename=libffi
pkgname=lib32-libffi5
pkgver=3.0.10
pkgrel=2
pkgdesc="A portable, high level programming interface to various calling conventions (ABI version 5)"
arch=('x86_64')
url="http://sourceware.org/libffi"
license=('MIT')
depends=('lib32-glibc')
makedepends=('gcc-multilib')
checkdepends=('dejagnu')
options=('!libtool')
source=(https://sourceware.org/pub/libffi/libffi-$pkgver.tar.gz)
sha256sums=('f01eb9027e9eb56aeaeef636649877756d475d714ef8b47f627f65bc5f3b492f')

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  
  export CC="gcc -m32"
  
  ./configure --prefix=/usr --libdir=/usr/lib32 --libexecdir=/usr/lib32
  make
}

package() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  make DESTDIR="$pkgdir" install
  
  mv "$pkgdir/usr/lib32/libffi.a" "$pkgdir/usr/lib32/libffi5.a"
  rm -f "$pkgdir/usr/lib32/libffi.so"
  rm -rf "$pkgdir/usr/lib32/pkgconfig" "$pkgdir/usr/share"
  
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
