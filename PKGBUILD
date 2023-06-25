# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="udeler-pro-bin"
pkgver=1.0.1
pkgrel=1
pkgdesc="Desktop application to download Udemy courses with attachments."
arch=("x86_64")
url="https://github.com/rsathishtechit/udeler-pro"
license=('custom')
depends=('dbus' 'mesa' 'at-spi2-core' 'nss' 'libxcomposite' 'nspr' 'cairo' 'libxcb' 'libxfixes' 'gcc-libs' 'libxkbcommon' \
    'alsa-lib' 'libxdamage' 'pango' 'libx11' 'expat' 'glibc' 'libxrandr' 'libdrm' 'libxext' 'gtk3' 'glib2' 'libcups')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('259b5344bf3015fb30d3831b23f2ca180663944eccaad3d2fe260ee46a8ebf41')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    install -Dm644 "${pkgdir}/usr/share/doc/${pkgname%-bin}/copyright" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed "s|Exec=udeler-pro|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    rm -rf "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/lintian"
}