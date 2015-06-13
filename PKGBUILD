# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=liblfds
pkgver=6.1.1
pkgrel=1
pkgdesc="Lock free data structures for C."
arch=('i686' 'x86_64')
url="http://www.liblfds.org/"
license=('custom:none')
depends=('glibc')
source=(http://www.liblfds.org/downloads/$pkgname%20release%20$pkgver%20source.tar.bz2)
md5sums=('ff3c5f1cb7805ab5b2d63c49d5e589e3')
_subname='liblfds611'

build() {
    cd "$srcdir/${pkgname}${pkgver}/$_subname"
    find "$srcdir" -type d -exec chmod +x {} \;
    cp makefile.linux makefile
    make clean
    make arrel
    cp bin/${_subname}.a ./
    make clean
    make sorel
}

package() {
    cd "$srcdir/${pkgname}${pkgver}/$_subname"
    install -Dm644 ${_subname}.a "$pkgdir/usr/lib/liblfds.a"
    install -Dm644 bin/${_subname}.so "$pkgdir/usr/lib/liblfds.so"
    install -Dm644 inc/${_subname}.h "$pkgdir/usr/include/liblfds.h"
    install -d "$pkgdir/usr/share/licenses/$pkgname/" 
    echo "There is no license. You are free to use this software in any way, for any purpose. Go forth and create wealth!" > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

