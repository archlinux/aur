# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=reqable-bin
pkgver=1.4.1
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
    "LICENSE.html")
sha256sums=('7440208294528e7d0dcfe76ea11b0e4dd0c878a31cde00b7a3109975363edd3a'
            '23392e1a40e734a004a13faec6db357230d1a3893a849ceaba3d25079a403630')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/usr/share/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}