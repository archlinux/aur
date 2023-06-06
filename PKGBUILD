# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="typesense-dashboard-bin"
_pkgname="Typesense-Dashboard"
pkgver=1.3.1
pkgrel=1
pkgdesc="A Typesense Dashboard to manage and browse collections."
arch=('x86_64')
url="https://bfritscher.github.io/typesense-dashboard/"
_githuburl="https://github.com/bfritscher/typesense-dashboard"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libxcb' 'cairo' 'libxcomposite' 'libxrandr' 'expat' 'glibc' 'nss' 'libxdamage' 'libcups' 'libxext' 'pango' 'gtk3' \
    'gcc-libs' 'libdrm' 'glib2' 'at-spi2-core' 'libxfixes' 'alsa-lib' 'mesa' 'nspr' 'dbus' 'libx11' 'libxkbcommon')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-linux-x64-v${pkgver}.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/bfritscher/typesense-dashboard/main/public/icons/favicon-128x128.png")
sha256sums=('ad0b4a4766d69786bdc442354a20c8d23eda37582f182df9e3e8a63b8216e85f'
            'ce61a0d27e9167938ce2083e1391de1ee514b40d8a0f5c3602a7a04f449f6779')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/dist/electron/${_pkgname}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${_pkgname}" --exec "/opt/${pkgname%-bin}/${_pkgname} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}