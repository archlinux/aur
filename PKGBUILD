# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pikatorrent-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="A modern, open source and electric BitTorrent app for mobile, desktop & server."
arch=('x86_64')
url="https://www.pikatorrent.com/"
_githuburl="https://github.com/G-Ray/pikatorrent"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('nss' 'nspr' 'libxext' 'gcc-libs' 'python' 'mesa' 'libxrandr' 'alsa-lib' 'libcups' 'gtk3' 'libxfixes' 'libxcomposite' 'cairo' 'libxcb' \
    'curl' 'bash' 'expat' 'at-spi2-core' 'glibc' 'dbus' 'glib2' 'libdrm' 'pango' 'libxkbcommon' 'nodejs' 'python-setuptools' 'libxdamage' 'libx11')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64-${pkgver}.zip")
sha256sums=('3b295e7aabac473ad80cf5c5fff315ba88b016566bacf2b238d352a44435324e')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f --icon "${pkgname%-bin}" --categories "Network;Utility" --name "PikaTorrent" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}