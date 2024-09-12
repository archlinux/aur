# Contributor: Lex Black <autumn-wind@web.de>

pkgname=picocrypt
pkgver=1.43
pkgrel=1
pkgdesc="A very small, very simple, yet very secure encryption tool."
arch=('i686' 'x86_64')
url="https://github.com/Picocrypt/Picocrypt"
license=('GPL-3-only')
depends=(gtk3)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz
        picocrypt.desktop)
sha512sums=('1a3abfbd38b20b3fdf007e79228f4712abb01a37b0c16bb7d3178602c679c0b702648e4e8cac3c3d45a1e4a51fc51da512d5dfb4a647f3d69fb1d591d5c62065'
            '1c499ed01d8550a0be97084903776e1b3c8922401e6a73270457ffdcfe879449d3d718ed4c3ae9dc2cf90a98952b76c9bf455871fbace77a563a8681dddf1d81')


build() {
    cd ${pkgname/p/P}-${pkgver}/src
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
        -o ${pkgname} \
        .
}

package(){
    install -Dm755 "${pkgname/p/P}-${pkgver}/src/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${pkgname/p/P}-${pkgver}/images/key.svg" "${pkgdir}/usr/share/pixmaps/picocrypt.svg"
    install -Dm644 picocrypt.desktop -t "${pkgdir}/usr/share/applications"
}
