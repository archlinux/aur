# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=qdecoder
pkgver=12.0.7
pkgrel=1
pkgdesc="qDecoder is a CGI library for C/C++ programming language which has been developed since 1996."
arch=('x86_64')
url="https://wolkykim.github.io/qdecoder/"
license=('CUSTOM')
depends=()
makedepends=('fcgi')
source=("https://github.com/wolkykim/qdecoder/archive/v${pkgver}.tar.gz")
sha256sums=('01d4852b9343757abe98bbdb9d4bf0dc142ccb602ec921906ddde32c16164376')


prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --enable-fastcgi=/usr/include --prefix="/usr"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "$pkgdir/usr/share/licenses/${pkgname}" "$pkgdir/usr/include" "$pkgdir/usr/lib"
    make DESTDIR="$pkgdir" install
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
}
