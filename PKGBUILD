# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=altair-bin
_appname="Altair GraphQL Client"
pkgver=5.2.10
pkgrel=1
pkgdesc="A beautiful feature-rich GraphQL Client for all platforms."
arch=('x86_64')
url="https://altairgraphql.dev/"
_ghurl="https://github.com/altair-graphql/altair"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron26'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64_linux.deb"
    "LICENSE::https://raw.githubusercontent.com/altair-graphql/altair/v${pkgver}/packages/altair-core/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('146287f607a089a5d778de3d480b5e509e447a758767ef36a46e2272501160eb'
            'a406579cd136771c705c521db86ca7d60a6f3de7c9b5460e6193a2df27861bde'
            '8f7e337fc8cf594b30f1cf0aa448a279212710313debee784eaac4141b53eb14')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 96x96 120x120 144x144 192x192 310x310;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}