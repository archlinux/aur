_pkgbasename=libffi
pkgname=libffi5
pkgver=3.0.13
pkgrel=1
pkgdesc="A portable, high level programming interface to various calling conventions (ABI version 5)"
arch=('i686' 'x86_64')
url="http://sourceware.org/libffi"
license=('MIT')
depends=('glibc')
checkdepends=('dejagnu')
options=('!libtool')
source=(ftp://sourceware.org/pub/libffi/libffi-$pkgver.tar.gz)
sha256sums=('1dddde1400c3bcb7749d398071af88c3e4754058d2d4c0b3696c2f82dc5cf11c')

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  make DESTDIR="$pkgdir" install

  mv "$pkgdir/usr/lib/libffi.a" "$pkgdir/usr/lib/libffi5.a"
  rm -f "$pkgdir/usr/lib/libffi.so"
  rm -rf "$pkgdir/usr/lib/pkgconfig" "$pkgdir/usr/share"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
