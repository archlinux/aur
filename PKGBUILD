# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yarle-evernote-to-md-bin
pkgver=5.8.2
pkgrel=2
pkgdesc="Yarle - The ultimate converter of Evernote notes to Markdown"
arch=(x86_64)
url="https://github.com/akosbalasko/yarle"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'electron22'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/akosbalasko/yarle/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('b327f774d768cbdbe019c35b5eee3fb1c32a05cba9b17a3ee29aa18154004cc0'
            '16691c563f896a0d485a742fbd5a389fc7c798ff606c75cb3f753bb7297a9bdb'
            '17532f4a93142427e0f4ef0da49de0a3758a342829773d7c83aadcd6c4753a36')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {    
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 64x64 192x192 512x512;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}