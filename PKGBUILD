# Maintainer: Fabio Comuni <fabrix.xm@gmail.com>
pkgname=quirc
_libver=1.0
pkgver=1.1
pkgrel=1
pkgdesc="QR decoder library."
arch=('i686' 'x86_64')
url="https://github.com/dlbeer/quirc/"
license=('ISC')
depends=('libjpeg-turbo')
makedepends=()
checkdepends=()
source=("https://github.com/dlbeer/quirc/archive/v${pkgver}.tar.gz")
md5sums=('ae8ab4a3d0e28fdcbf0880eca5494772')

build() {
    cd "$pkgname-$pkgver"
    CFLAGS="$CFLAGS -fPIC"
    make libquirc.a libquirc.so quirc-scanner
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir/"
    PREFIX="usr"
        
    install -Dm644 lib/quirc.h ${DESTDIR}${PREFIX}/include/quirc.h
    install -Dm0644 libquirc.a ${DESTDIR}${PREFIX}/lib/libquirc.a
    install -Dm0755 libquirc.so.${_libver} ${DESTDIR}${PREFIX}/lib/libquirc.so.${_libver}
    install -Dm0755 quirc-scanner ${DESTDIR}${PREFIX}/bin/quirc-scanner

}

