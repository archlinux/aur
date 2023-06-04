# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="orbitnx-bin"
pkgver=3.0.0
pkgrel=1
pkgdesc="A WiP Electron and Python based payload injector, with built in tools to make modding your switch easier. (Rewrite now in development!)"
arch=('x86_64')
url="https://github.com/OrbitNX/OrbitNX"
license=('GPL2')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('mesa' 'dbus' 'libxcomposite' 'libxcb' 'gcc-libs' 'expat' 'python' 'cairo' 'libx11' 'glib2' 'libcups' 'nspr' 'glibc' \
    'gtk3' 'libxkbcommon' 'libxext' 'libxrandr' 'at-spi2-core' 'libxdamage' 'wayland' 'nss' 'libdrm' 'alsa-lib' 'pango' 'libxfixes')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}a3/${pkgname%-bin}-${pkgver}.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/OrbitNX/OrbitNX/rewrite/build/icon.png")
sha256sums=('55ce794775c9409bda77f423c54ed3ccb68817461dfe59e71fc8db698b19c28d'
            'eb41e2fed47defc0a0f81311a9a19b7afc5da8b6e1612647a282e448bc211f0e')
 
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f --icon "${pkgname%-bin}" --categories "Utility" --name "OrbitNX" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}