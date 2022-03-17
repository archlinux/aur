# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: sifyfy <sifyfy@sifyfy.dev>

pkgname=libgmp-static
pkgver=6.2.1
pkgrel=1
pkgdesc='A free library for arbitrary precision arithmetic, but only includes libgmp.a and libgmpxx.a'
arch=('x86_64')
depends=("gmp>=$pkgver")
url=https://gmplib.org
license=('LGPL3' 'GPL2')
source=("https://gmplib.org/download/gmp/gmp-$pkgver.tar.lz")
sha512sums=('40e1c80d1a2eda0ea190ba2a27e7bfe718ee1fc685082b4f2251f108ffbec94272199b35cf6df217c9f6f10ac4132eaf3c5014a9e25db0592b94f7f1ddd4994f')

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
