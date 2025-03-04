# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=chengla
pkgname="${_pkgname}-linux-unofficial-bin"
pkgver=1.0.8
_electronversion=27
pkgrel=7
pkgdesc="The unofficial Linux client side of OrangeVIP platform.(Prebuilt version.Use system-wide electron)橙啦平台的非官方Linux客户端"
arch=('x86_64')
url="https://github.com/pokon548/chengla-for-linux"
license=("GPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('0768fab1de576308278eb5e75f2045c296c59c14dca83f5295f82c9d44338972'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/icon.png" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}