# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=p3x-redis-ui-bin
_appname=P3X-Redis-UI
pkgver=2023.10.243
pkgrel=3
pkgdesc="A very functional handy database GUI and works in your pocket on the responsive web or as a desktop app"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://www.corifeus.com/redis-ui"
_ghurl="https://github.com/patrikx3/redis-ui"
license=("MIT")
conflicts=("${pkgname%-bin}=${pkgver}")
providers=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'electron25'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
source=(
    "LICENSE::https://raw.githubusercontent.com/patrikx3/redis-ui/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('a44e4f4811cc55ebe83c9ba750697ee94c56401c1f3963ace79fa6938ebb46ac'
            '2036372d05355f2a25fbaeb5d70b91bfa95a9d2b45b4add5f589316d06f500f9')
sha256sums_aarch64=('5f933871e30a426942fb9a89ab3fa0000438d456fa4232bf9389690bbe5318f8')
sha256sums_armv7h=('50fe5bcf2c4f5e59f6b732ffe93f22f69c19db543d10a1484b6a83c707c035ee')
sha256sums_x86_64=('266f0ce05adae5048563e893fa2970f88c55ce0fbbafee7653be43b120b2dd04')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}