# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=reqable-bin
pkgver=1.1.8
pkgrel=1
pkgdesc="A cross platform professional HTTP development and Debugger that supports HTTP1, HTTP2, and HTTP3 (QUIC) protocols"
arch=('x86_64')
url="https://reqable.com"
_githuburl="https://github.com/reqable/reqable-app"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('xz' 'libdbusmenu-gtk3' 'libgcrypt' 'gtk3' 'libayatana-appindicator' 'libepoxy' 'libayatana-indicator' 'libgpg-error' 'lz4' 'pango' \
    'nspr' 'glibc' 'util-linux-libs' 'cairo' 'harfbuzz' 'at-spi2-core' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'nss' 'libdbusmenu-glib')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-app-linux-${CARCH}.deb"
    "LICENSE::${url}/zh-CN/policy")
sha256sums=('45a80d90431b5cb863035d5f5171b0676f90e3e112288103e320b07ffc2a343b'
            '64f80c16320c8e71c523403d1247931fa782429f650e68f3d0986aa653726f06')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    sed "s|/usr/share/${pkgname%-bin}/${pkgname%-bin}|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/license/${pkgname}"
}