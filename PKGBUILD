# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hexhoot-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="An Opensource Peer-to-peer communication platform with Zero-Knowledge-Proof based authentication."
arch=(x86_64)
url="http://blog.hexhoot.com/"
_githuburl="https://github.com/zenineasa/HexHoot"
license=('AGPL3')
depends=('gcc-libs' 'cairo' 'dbus' 'libxdamage' 'expat' 'gtk3' 'libcups' 'libxext' 'pango' 'alsa-lib' 'libxrandr' 'at-spi2-core' \
    'libx11' 'nss' 'glib2' 'nspr' 'libdrm' 'libxfixes' 'glibc' 'libxcb' 'libxkbcommon' 'mesa' 'nodejs' 'libxcomposite')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('32718c19454f79216858ef3406f59a777e3f1724330d716498d5b4cb262eab9d')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    sed "s|Exec=${pkgname%-bin}|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}