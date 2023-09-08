# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=postbird-bin
_pkgname=Postbird
pkgver=0.8.4
pkgrel=2
pkgdesc="Open source PostgreSQL GUI client for macOS, Linux and Windows"
arch=('x86_64')
url="https://github.com/Paxa/postbird"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libxdamage' 'alsa-lib' 'libxss' 'libxtst' 'gtk3' 'at-spi2-core' 'glib2' 'expat' 'libxcomposite' 'libxrandr' \
    'libxcb' 'libx11' 'glibc' 'libxext' 'libcups' 'cairo' 'gcc-libs' 'libxi' 'pango' 'libxfixes' 'dbus' 'libxrender' 'nss' \
    'util-linux-libs' 'gdk-pixbuf2' 'nspr' 'libxcursor')
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.pacman"
  "LICENSE::https://raw.githubusercontent.com/Paxa/postbird/${pkgver}/LICENSE")
sha256sums=('e3cc9eb893a35ddd0cc93ca10e526957c9c04896044a3b7c0f445daad45adfea'
            'd93e84fa24bbea7e92d6cd171968d8da1f4a28047cc704f0700d17b57c7a9a9c')
prepare() {
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin} --no-sandbox %U|g;s|Programming|Development|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{usr/bin,opt/"${pkgname%-bin}"}
    cp -r "${srcdir}/opt/${pkgname%-bin}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}