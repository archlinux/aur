# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=realm-studio-bin
pkgver=14.0.3
pkgrel=1
pkgdesc='A tool, any developer or system administrator would use when building and maintaining their app built on the Realm Mobile Platform.'
arch=('x86_64')
url="https://realm.io/products/realm-studio/"
_githuburl="https://github.com/realm/realm-studio"
license=('Apache')
depends=('cairo' 'libxext' 'libxkbcommon' 'libdrm' 'nspr' 'libx11' 'gtk3' 'libxdamage' 'gcc-libs' 'libxrandr' 'libcups' 'mesa' \
    'at-spi2-core' 'libxcomposite' 'libxfixes' 'glibc' 'expat' 'alsa-lib' 'nss' 'dbus' 'pango' 'libxcb' 'glib2')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/realm/realm-studio/channel/major-14/resources/icon.png")
sha256sums=('af0783f448d37267f7967f0d82c54cca6cffc073d9563061a81a18888c9ab003'
            'b805ac8f6d254316eb3d5bb052d58e36054a933401e4f493af66e1c6cd2ed0fb')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f --icon "${pkgname%-bin}" --categories "Development;Utility" --name "Realm Studio" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}