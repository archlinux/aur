# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=swesence-bin
_appname=Swesence
pkgver=1.0.0
pkgrel=1
pkgdesc="Show your Nintendo Switch activity to Discord using Rich Presence"
arch=("x86_64")
url="https://github.com/glitchcodes/Swesence"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron20')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/glitchcodes/Swesence/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('0f81bb4918b95dc6b0eb0fa4c69d2db51082cf75f0f124707e64aaef10bc1e85'
            'a5dee15a267db7d60b958f60d957f9cbdc28cf64e8f5ada0e28ecdafda4ca4bd'
            '932155524422c0f48e3f43a86a11ac168d84c3bc042a0bca2858adeac6b797db')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}