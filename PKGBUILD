# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=myapp-scrapthatpage-bin
pkgver=1.0.0
pkgrel=4
pkgdesc="A desktop app that automates web scraper with easy to use script actions."
arch=('aarch64' 'x86_64')
url="https://github.com/kaushalmeena/myapp-scrapthatpage"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('alsa-lib' 'gtk3' 'at-spi2-core' 'nss' 'glibc' 'libx11' 'libcups' 'pango' 'libdrm' 'libxext' 'libxrandr' 'nspr' \
    'mesa' 'libxcb' 'gcc-libs' 'dbus' 'expat' 'libxdamage' 'libxfixes' 'libxkbcommon' 'cairo' 'glib2' 'libxcomposite')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_aarch64=('396a63f91399afcaed82d7153e5ec61ca8169815934c98e6b20b50e1aa462c1b')
sha256sums_x86_64=('8695fc432cc4f8be29b53ebc773152809a5a7b407d55c1b92875c15ecfe9c9f1')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt/"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}