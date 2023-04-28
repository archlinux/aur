# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Thomas Höß <hi@thomsn.de>
# Contributor: Prepros <hi@prepros.io>
# Contributor: solopasha <daron439 at gmail dot com>
pkgname=prepros-bin
pkgver=7.7.0
pkgrel=2
pkgdesc="Prepros compiles your files, transpiles your JavaScript, reloads your browsers and makes it really easy to develop & test your websites so you can focus on making them perfect."
arch=('x86_64')
url="https://prepros.io"
license=('custom:proprietary')
depends=('nspr' 'at-spi2-core' 'alsa-lib' 'libxfixes' 'glibc' 'libxcomposite' 'gcc-libs' 'libxrandr' 'cairo' \
    'expat' 'libdrm' 'sh' 'libxcb' 'perl' 'libcups' 'libxext' 'glib2' 'dbus' 'pango' 'mesa' 'zlib' 'libx11' \
    'libxdamage' 'gdk-pixbuf2' 'libxkbcommon' 'gtk3' 'nodejs' 'java-runtime' 'nss')
options=('!strip')
source=("${pkgname%-bin}-${pkgver}.deb::https://downloads.prepros.io/v7/${pkgver}/Prepros-${pkgver}.deb")
sha256sums=('0cc2137f97428954bc86b3a5cee198401d32189b0d9bfde57bb1d5273eb5fa11')
prepare() {
    mkdir "${srcdir}/tmp"
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${srcdir}/tmp"
    sed 's|Exec=prepros|Exec=/opt/prepros/prepros|g' -i "${srcdir}/tmp/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr"
    cp -r "${srcdir}/tmp/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    cp -r "${srcdir}/tmp/usr/share" "${pkgdir}/usr"
    install -Dm755 "${srcdir}/tmp/usr/bin/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/license"
}