# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="meteor-bin"
pkgver=2.0.1
pkgrel=1
pkgdesc="A meter based ToDo List. used Electron-Vue"
arch=("x86_64")
url="https://hideko.f5.si/project/meteor.html"
_githuburl="https://github.com/Hideko-Dev/Meteor"
license=('MIT')
depends=('libxext' 'libx11' 'gcc-libs' 'hicolor-icon-theme' 'glibc' 'libxrandr' 'gtk3' 'nss' 'libxcomposite' 'pango' 'cairo' 'libdrm' \
    'nspr' 'alsa-lib' 'nodejs' 'at-spi2-core' 'libxfixes' 'expat' 'glib2' 'libxdamage' 'dbus' 'libcups' 'sh' 'mesa' 'libxkbcommon' 'libxcb')
conflicts=("${pkgname%-bin}")
noextract=()
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/${pkgver}/Meteor-linux-x64.zip")
sha256sums=('890bc15a4b63ced7fe71f0e18936280de582960ecde0bb91d62dfcd7544a9394')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/Meteor-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/resources/app/assets/png/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/resources/app/assets/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    gendesk -f --icon "${pkgname%-bin}" --categories "Utility" --name "Meteor" --exec "/opt/${pkgname%-bin}/Meteor %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}