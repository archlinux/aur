# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=liblo-ipv6
pkgver=0.29
pkgrel=1
epoch=1
pkgdesc="A lightweight OSC (Open Sound Control) implementation (with IPv6 support)"
arch=('i686' 'x86_64')
url="http://liblo.sourceforge.net/"
license=('GPL')
depends=('glibc')
provides=('liblo' "liblo=$pkgver")
conflicts=('liblo')
source=("http://downloads.sourceforge.net/liblo/liblo-$pkgver.tar.gz"
        "liblo-ipv6-resolve.patch")
md5sums=('b0e70bc0fb2254addf94adddf85cffd3'
         'b5c03baf4684d4fa8f38cad950b7506f')


prepare() {
  cd "$srcdir/liblo-$pkgver"

  patch -p1 -i "$srcdir/liblo-ipv6-resolve.patch"
}

build() {
  cd "$srcdir/liblo-$pkgver"

  ./configure --prefix=/usr --enable-ipv6
  make
}

package() {
  cd "$srcdir/liblo-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
