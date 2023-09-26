# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sengi-bin
_appname=Sengi
pkgver=1.8.0
pkgrel=2
pkgdesc="Mastodon & Pleroma Multi-account Desktop Client"
arch=('x86_64')
url="https://github.com/NicolasConstant/sengi"
_downurl="https://github.com/NicolasConstant/sengi-electron"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron23' 'hicolor-icon-theme')
source=("${pkgname%-bin}${pkgver}.deb::${_downurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux.deb"
    "${pkgname%-bin}.sh")
sha256sums=('0b6a43409861217dd11a76e34de174715adaaac1c3de3927d2f6bf08c5b81a4e'
            '01846117ce40dbf09b03393e3943e504554c34d7dfffe2727bad4b596b6d9773')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}