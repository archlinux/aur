# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: sifyfy <sifyfy@sifyfy.dev>

pkgname=libgmp-static
pkgver=6.3.0
pkgrel=1
pkgdesc='A free library for arbitrary precision arithmetic, but only includes libgmp.a and libgmpxx.a'
arch=('x86_64')
depends=("gmp>=$pkgver")
url=https://gmplib.org
license=('LGPL3' 'GPL2')
options=(!lto)
source=("https://gmplib.org/download/gmp/gmp-$pkgver.tar.lz")
sha512sums=('b70f3603ab40270fa6e9a7ee1dc0f91477e45803d3ee2f22af924af89dcd18b483c900685310c9e69cee91dc1b6dec00cfec6a8a111022d0122b5427209a4a2d')

package() {
    cd gmp-$pkgver

    ./configure --prefix=$pkgdir/usr --enable-static --disable-shared --enable-cxx CFLAGS=-fPIC CPPFLAGS=-DPIC
    make
    make check
    make install

    rm -rf $pkgdir/usr/include
    rm -rf $pkgdir/usr/share
    rm -rf $pkgdir/usr/lib/pkgconfig
}
