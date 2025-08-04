# Contributor: Lex Black <autumn-wind@web.de>

pkgname=picocrypt
pkgver=1.49
pkgrel=1
pkgdesc="A very small, very simple, yet very secure encryption tool."
arch=('i686' 'x86_64')
url="https://github.com/Picocrypt/Picocrypt"
license=('GPL-3-only')
depends=(gtk3)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz
        picocrypt.desktop)
sha512sums=('98eeee2bb25337f2536935699587661099e4b478b30b413982334508888d53dfd8181329938fb095382af45acb16b3ca9aa81d6384ef5d9a26ef8023ed1d7c17'
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
