# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="geforcenow-electron-bin"
pkgver=1.11.0
pkgrel=1
pkgdesc="Linux Desktop client for Nvidia's GeForce NOW game streaming service"
arch=('x86_64')
url="https://github.com/hmlendea/gfn-electron"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('at-spi2-core' 'libx11' 'libxdamage' 'alsa-lib' 'nss' 'libxext' 'cairo' 'pango' 'gcc-libs' 'mesa' 'nodejs' 'libxcomposite' \
    'gtk3' 'libdrm' 'libxcb' 'glibc' 'glib2' 'libxfixes' 'nspr' 'dbus' 'libxkbcommon' 'libxrandr' 'python' 'expat' 'libcups')
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux.zip")
sha256sums=('67a4b86a2213f96a7359ff8702d759c1de5d9fb36267ee0d5e57647ac9e44a97')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    sed "s|nvidia|${pkgname%-bin}|g" -i "${pkgdir}/opt/${pkgname%-bin}/com.github.hmlendea.${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/com.github.hmlendea.${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}