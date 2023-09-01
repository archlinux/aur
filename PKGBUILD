# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=reqable-bin
pkgver=1.2.4
pkgrel=1
pkgdesc="A cross platform professional HTTP development and Debugger that supports HTTP1, HTTP2, and HTTP3 (QUIC) protocols"
arch=('x86_64')
url="https://reqable.com"
_githuburl="https://github.com/reqable/reqable-app"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('xz' 'libdbusmenu-gtk3' 'libgcrypt' 'gtk3' 'libayatana-appindicator' 'libepoxy' 'libayatana-indicator' 'libgpg-error' 'lz4' 'pango' \
    'nspr' 'glibc' 'util-linux-libs' 'cairo' 'harfbuzz' 'at-spi2-core' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'nss' 'libdbusmenu-glib' 'fontconfig')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-app-linux-${CARCH}.deb"
    "LICENSE::${url}/zh-CN/policy")
sha256sums=('3b53325d6b88beb0bd43c985a86ea56243308d252d4150ca3cd0c4165ed86c1c'
            '059bab41ea6d7aac01fb58cc8a237eeaf5471989ca76903cd053245cb50b51bb')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/usr/share/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/license/${pkgname}"
}