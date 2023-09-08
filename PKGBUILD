# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shadowsocks-electron-bin
_pkgname="Shadowsocks Electron"
pkgver=1.2.3
pkgrel=3
pkgdesc="Shadowsocks GUI application made for Ubuntu/Mac/Win users and powered by Electron."
arch=('x86_64')
url="https://github.com/nojsja/shadowsocks-electron"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libxkbcommon' 'gcc-libs' 'libxrandr' 'expat' 'libxdamage' 'mesa' 'libxext' 'gtk3' 'nspr' 'dbus' 'libxcb' \
    'hicolor-icon-theme' 'libx11' 'libdrm' 'cairo' 'glibc' 'libcups' 'glib2' 'alsa-lib' 'gdk-pixbuf2' 'libxcomposite' \
    'pango' 'nss' 'at-spi2-core' 'libxfixes')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/shadowsocks-electron_${pkgver}_amd64.deb")
sha256sums=('f66c31e67b046c156a841219446f89c571daebc22458b456451c59f400be1c36')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\" %U|${pkgname%-bin} --no-sandbox %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}