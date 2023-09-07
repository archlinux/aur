# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=iron
pkgname="srware-${_pkgname}-bin"
pkgver=115.0.5850.0
pkgrel=1
pkgdesc="SRWare Iron Browser is a light-weight browser,based on Chromium"
arch=("aarch64" "armv7h" "x86_64")
url="https://www.srware.net"
license=('GPL2')
depends=('gtk2' 'alsa-lib' 'qt5-base' 'nss' 'at-spi2-core' 'libx11' 'libxcb' 'libxfixes' 'cairo' 'libxcomposite' 'libdrm' 'glib2' \
    'libxext' 'libxdamage' 'gdk-pixbuf2' 'glibc' 'pango' 'nspr' 'mesa' 'libxrandr' 'libcups' 'sh' 'libxkbcommon' 'dbus' 'gcc-libs' 'expat')
conflicts=("${pkgname%-bin}")
provides=("SRWare")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/downloads/${_pkgname}arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${url}/downloads/${_pkgname}arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/downloads/${_pkgname}64.deb")
source=("LICENSE::${url}/license.txt")
sha256sums=('a29953afc386e2a9a95906cfa0de4bf58a332260d7199a5f99d3e15db9381022')
sha256sums_aarch64=('0a8e607adccb88184b1dd698daddf9772ff27f91a2f0a37dcc5e7c83ebc40825')
sha256sums_armv7h=('0a8e607adccb88184b1dd698daddf9772ff27f91a2f0a37dcc5e7c83ebc40825')
sha256sums_x86_64=('08102373380eaf950aec0966db874f232a974ece5cbd2f54f5dfa33e3b708a5d')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/usr/share/${_pkgname}/chrome-wrapper|${pkgname%-bin}|g;s|${_pkgname}_product_logo|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    sed "s|/usr/share/${_pkgname}/IronConfigBackup|${pkgname%-bin}-configbackup|g;s|${_pkgname}_product_logo|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}_backup.desktop"
    chmod 755 "${srcdir}/usr/share/${_pkgname}/extensions" \
        "${srcdir}/usr/share/${_pkgname}/chrome-wrapper" \
        "${srcdir}/usr/share/${_pkgname}/IronConfigBackup"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/usr/share/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/chrome-wrapper" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/IronConfigBackup" "${pkgdir}/usr/bin/${pkgname%-bin}-configbackup"
    install -Dm644 "${srcdir}/usr/share/applications/"*.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}_product_logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}