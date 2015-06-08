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
source=(ftp://sourceware.org/pub/libffi/libffi-$pkgver.tar.gz)
md5sums=('79390673f5d07a8fb342bc09b5055b6f')

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
