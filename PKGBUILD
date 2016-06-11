# Maintainer: orumin <dev@orum.in>

_basename=mtdev
pkgname="lib32-$_basename"
pkgver=1.1.5
pkgrel=1
pkgdesc="A stand-alone library which transforms all variants of kernel MT events to the slotted type B protocol (32-bit)"
arch=('x86_64')
url="http://bitmath.org/code/mtdev/"
license=('custom:MIT')
depends=('glibc' "$_basename")
source=("$url$_basename-$pkgver.tar.bz2")
md5sums=('52c9610b6002f71d1642dc1a1cca5ec1')

build() {
  cd "$srcdir/$_basename-$pkgver"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --disable-static \
    --build=i686-pc-linux-gnu --libdir=/usr/lib32 
  make
}

check() {
  cd "$srcdir/$_basename-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$_basename-$pkgver"
  make DESTDIR="$pkgdir/" install

  cd "$pkgdir"/usr
  rm -r bin include

}
