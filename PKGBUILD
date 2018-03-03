# Maintainer: Fabio Comuni <fabrix.xm@gmail.com>
pkgname=quirc
pkgver=1.0
pkgrel=1
pkgdesc="QR decoder library."
arch=('i686' 'x86_64')
url="https://github.com/dlbeer/quirc/"
license=('ISC')
depends=('libjpeg-turbo')
makedepends=()
checkdepends=()
source=("https://github.com/dlbeer/quirc/archive/v1.0.tar.gz")
md5sums=('983e9baa181d9e0b93b0e6f9bf6adebb')

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
    install -Dm0755 libquirc.so.${pkgver} ${DESTDIR}${PREFIX}/lib/libquirc.so.${pkgver}
    install -Dm0755 quirc-scanner ${DESTDIR}${PREFIX}/bin/quirc-scanner

}

