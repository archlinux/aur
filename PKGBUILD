# Contributor: Lex Black <autumn-wind@web.de>

pkgname=picocrypt
pkgver=1.46
pkgrel=1
pkgdesc="A very small, very simple, yet very secure encryption tool."
arch=('i686' 'x86_64')
url="https://github.com/Picocrypt/Picocrypt"
license=('GPL-3-only')
depends=(gtk3)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz
        picocrypt.desktop)
sha512sums=('9cc7073c1ed3e842e49eed0227874f683722719b9d60a5f80a298efafae749cd9f77744df46f6181639abbf2ddc4702f184ac0c55f0fb38942931757df19247a'
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
