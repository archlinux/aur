# Maintainer: kevku <kevku@gmx.com>
pkgname=librtmfp-git
pkgver=r162.eac2eb6
pkgrel=1
pkgdesc="LGPL implementation of RTMFP (client part)"
arch=('i686' 'x86_64')
url="https://github.com/MonaSolutions/librtmfp"
license=('LGPL3')
depends=('openssl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('librtmfp::git+https://github.com/MonaSolutions/librtmfp.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make
    make librtmfp.pc
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm644 "./include/librtmfp.h" "$pkgdir/usr/include/librtmfp/librtmfp.h"
    install -Dm644 "./lib/librtmfp.so" "$pkgdir/usr/lib/librtmfp.so"
    install -Dm644 "./librtmfp.pc" "$pkgdir/usr/lib/pkgconfig/librtmfp.pc"
}
