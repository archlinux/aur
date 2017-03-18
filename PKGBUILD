# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=liblfds
pkgver=7.1.1
pkgrel=1
_subname='liblfds711'
pkgdesc="Lock free data structures for C."
arch=('i686' 'x86_64')
url="http://www.liblfds.org/"
license=('custom:none')
depends=('glibc')
source=(http://www.liblfds.org/downloads/$pkgname%20release%20$pkgver%20source.tar.bz2)
md5sums=('2a4cb6d64d8d9333b050059e4a1b7782')

build() {
    cd "$srcdir/${pkgname}${pkgver}/$_subname"
    cd build/gcc_gnumake
    make clean
    make ar_rel
    cp ../../bin/${_subname}.a ../../
    make clean
    make so_rel
}

package() {
    cd "$srcdir/${pkgname}${pkgver}/$_subname"
    install -Dm644 ${_subname}.a "$pkgdir/usr/lib/liblfds.a"
    install -Dm644 bin/${_subname}.so.1.0.0 "$pkgdir/usr/lib/liblfds.so.1.0.0"
    install -Dm644 inc/${_subname}.h "$pkgdir/usr/include/liblfds.h"
    install -d "$pkgdir/usr/share/licenses/$pkgname/" 
    echo "There is no license. You are free to use this software in any way, for any purpose. Go forth and create wealth!" > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "$pkgdir/usr/lib/"
    ln -s liblfds.so.1.0.0 liblfds.so.1
    ln -s liblfds.so.1.0.0 liblfds.so
}

