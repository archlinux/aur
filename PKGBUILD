# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=meteor-bin
_pkgname=Meteor
pkgver=2.0.1
pkgrel=4
pkgdesc="A meter based ToDo List. used Electron-Vue"
arch=("x86_64")
url="https://hideko.f5.si/project/meteor.html"
_ghurl="https://github.com/Hideko-Dev/Meteor"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libxext'
    'libx11'
    'hicolor-icon-theme'
    'libxrandr'
    'gtk3'
    'nss'
    'libxcomposite'
    'pango'
    'cairo'
    'libdrm'
    'nspr'
    'alsa-lib'
    'at-spi2-core'
    'libxfixes'
    'expat'
    'libxdamage'
    'dbus'
    'libcups'
    'mesa'
    'libxkbcommon'
    'libxcb'
)
makedepends=(
    'gendesk'
)
source=("${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/${pkgver}/${_pkgname}-linux-x64.zip")
sha256sums=('890bc15a4b63ced7fe71f0e18936280de582960ecde0bb91d62dfcd7544a9394')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin} --no-sandbox %U"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${_pkgname}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app/assets/png/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app/assets/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}