# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aniflix-bin
pkgver=0.0.1
pkgrel=5
pkgdesc="Anime Streaming Desktop App"
arch=('x86_64')
url="https://aniflix.lamaau.space/"
_githuburl="https://github.com/rizkhal/aniflix"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron23')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_0.1.0_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/rizkhal/aniflix/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('db3c22d7f9d359852125fd5f3dc570fe540d3e10b2a172472cbf0c9df2b986da'
            'c3cc74287725f86a3a56a0e4d88895716ff81ff3c576ae69221feaa2539c0f86'
            '5ccf6e88ad0e1bd5485fce22f52668a53e9f654378c67fd8a4bbe3491c97212d')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin}|g" \
        -e "s|Categories=Video;|Categories=AudioVideo;|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"    
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}