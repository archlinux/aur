# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=texturelab-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Free, Cross-Platform, GPU-Accelerated Procedural Texture Generator"
arch=('x86_64')
url="https://github.com/njbrown/texturelab"
license=('GPL3')
provides=()
depends=('libxfixes' 'gcc-libs' 'glibc' 'libxcb' 'at-spi2-core' 'gdk-pixbuf2' 'alsa-lib' 'libxdamage' 'libxrandr' 'expat' 'nss' \
    'libxcomposite' 'libcups' 'nspr' 'dbus' 'libx11' 'cairo' 'pango' 'libdrm' 'libxkbcommon' 'mesa' 'glib2' 'libxshmfence' 'libxext' 'gtk3')
makedepends=('gendesk')
conflicts=("${pkgname%-bin}")
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-v${pkgver}.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/njbrown/texturelab/master/public/icon.png")
sha256sums=('eafb5ae20d3df5497c1a5f680ee2438bd2bf0b43bbc4047deb06bd0ab3e68803'
            '627375f6ac09cce1a332e5e28920d074a62f17349f32f16f17f0de3e0239aced')
 
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${pkgdir}/opt/${pkgname%-bin}" --gname root --uname root
    gendesk -f --icon "${pkgname%-bin}" --categories "Development;Utility" --name "TextureLab" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}