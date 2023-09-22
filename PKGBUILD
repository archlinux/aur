# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=blix-bin
_pkgname=Blix
pkgver=1.1.0
pkgrel=1
pkgdesc="A cross-platform AI-assisted graph photo editor."
arch=('aarch64' 'x86_64')
url="https://github.com/COS301-SE-2023/AI-Photo-Editor"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libxext' 'nss' 'libxfixes' 'libxcb' 'gcc-libs' 'pango' 'libcups' 'cairo' 'mesa' 'alsa-lib' 'dbus' 'libx11' 'glib2' \
    'libxdamage' 'gtk3' 'libxcomposite' 'libdrm' 'at-spi2-core' 'expat' 'libxrandr' 'glibc' 'libxkbcommon' 'nspr')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_aarch64=('b14724d63464c82a8fdf3926528047ca55d7c6756e0c5fc52914347976c6cc25')
sha256sums_x86_64=('cc193757e2e0e5a43cfc28c1c8d01735a232a1df091117d8522257940ecd4dbf')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g;s|productivity|Graphics|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}