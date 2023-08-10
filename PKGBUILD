# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=blix-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="A cross-platform AI-assisted graph photo editor."
arch=('x86_64')
url="https://github.com/COS301-SE-2023/AI-Photo-Editor"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libxext' 'nss' 'libxfixes' 'libxcb' 'gcc-libs' 'pango' 'libcups' 'cairo' 'mesa' 'alsa-lib' 'python-pydantic' 'python' \
    'libxdamage' 'gtk3' 'libxcomposite' 'libdrm' 'at-spi2-core' 'expat' 'libxrandr' 'glibc' 'libxkbcommon' 'nspr' 'dbus' 'libx11' 'glib2')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/blix-1.0.0_linux64.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/COS301-SE-2023/AI-Photo-Editor/master/public/images/icon.png")
sha256sums=('6602675805063bc723b61731c0088c92d8a274e215798777fecfe22bc0a39535'
            'c2e87ac39808b7be901ffd9ca8f061780b158b4ebccef5f5dc484dc71b5f7b12')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}_linux64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Graphics" --name "Blix" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}