# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=slack-on-keys-bin
pkgver=1.1.2
_electronversion=24
pkgrel=6
pkgdesc="Control your Slack from any app window with keyboard shortcuts ⚡ Set up custom keyboard shortcuts for various Slack actions.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/yakshaG/slack-on-keys"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/yakshaG/slack-on-keys/main/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('a649e09849673ed533723c6f2de772eaeb4df031d2926e8c556edf8ebb7f2f0a'
            'f95d9068a4ccb1cbc8bad397f046494b5e2d6546fd6be7546edd5c26765cd956'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}