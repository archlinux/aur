# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="myapp-scrapthatpage-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="A desktop app that automates web scraper with easy to use script actions."
arch=('x86_64')
url="https://github.com/kaushalmeena/myapp-scrapthatpage"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('alsa-lib' 'gtk3' 'at-spi2-core' 'nss' 'glibc' 'libx11' 'libcups' 'pango' 'libdrm' 'libxext' 'libxrandr' 'nspr' \
    'mesa' 'libxcb' 'gcc-libs' 'dbus' 'expat' 'libxdamage' 'libxfixes' 'libxkbcommon' 'cairo' 'glib2' 'libxcomposite')
source=("${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}_${arch}.rpm")
sha256sums=('f83868950cf67370be4e77f6dcbd8ff55f43f6c76b2343c9637f8b2a60cab836')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -r "${srcdir}/usr/share/"* "${pkgdir}/usr/share"
    sed 's|Exec=myapp-scrapthatpage|Exec=/opt/myapp-scrapthatpage/myapp-scrapthatpage|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}