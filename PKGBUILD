# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=promethium-bin
_pkgname=Promethium
pkgver=6.1.6
pkgrel=3
pkgdesc="Extensible, fast, and innovative Electron based web browser with Material UI design elements and built-in AdBlock."
arch=('x86_64')
url="https://github.com/Alex313031/promethium"
license=('GPL3')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('nspr' 'alsa-lib' 'glib2' 'libx11' 'libxcb' 'libxkbcommon' 'libxcomposite' 'libxext' 'hicolor-icon-theme' 'gcc-libs' 'gtk3' \
    'libxdamage' 'libxfixes' 'dbus' 'expat' 'mesa' 'at-spi2-core' 'cairo' 'wayland' 'pango' 'libcups' 'libxrandr' 'nss' 'glibc' 'libdrm')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('74da657f5b07c32f91ca7fdac99af9f53f1f89b6b429364918f618f81bc26b27')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin} --no-sandbox %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}