# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=swesence-bin
_appname=Swesence
pkgver=1.0.0
pkgrel=2
pkgdesc="Show your Nintendo Switch activity to Discord using Rich Presence"
arch=("x86_64")
url="https://github.com/glitchcodes/Swesence"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron20')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/glitchcodes/Swesence/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('0f81bb4918b95dc6b0eb0fa4c69d2db51082cf75f0f124707e64aaef10bc1e85'
            'a5dee15a267db7d60b958f60d957f9cbdc28cf64e8f5ada0e28ecdafda4ca4bd'
            '7ab63e2afa84c3b828d5519b74118f393c7b8b568e847abba127374727b7ccc2')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/app.asar"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}