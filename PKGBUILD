# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: itsagoodbrain <itsrottenisay@gmail.com>
pkgname=zettlr-bin
_appname=Zettlr
pkgver=3.0.0.beta.6
_pkgver=3.0.0-beta.6
pkgrel=1
pkgdesc="A markdown editor for writing academic texts and taking notes"
arch=('aarch64' 'x86_64')
url="https://www.zettlr.com"
_githuburl="https://github.com/Zettlr/Zettlr"
license=(GPL3)
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'electron25' 'gcc-libs' 'glibc')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${_pkgver}/Zettlr-${_pkgver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${_pkgver}/Zettlr-${_pkgver}-amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('4a878f0c5f970da063debe22cf9d8c83690208c71f669274674c7138f66a3814')
sha256sums_aarch64=('6c4966fb6761d6ff1e7fc29e0caf3c48df0e63c3435018cd62d60367adc6a225')
sha256sums_x86_64=('18560b54925297ca35d802d0235ce2b01ed60b5805c9f634bd96cee324598291')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|/opt/${_appname}/${_appname} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 22x22 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_appname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
    install -Dm644 "${srcdir}/opt/${_appname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}