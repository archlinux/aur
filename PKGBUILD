# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=anklang-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="MIDI and Audio Synthesizer and Composer"
arch=('x86_64')
url="https://github.com/tim-janik/anklang"
license=("MPL2")
depends=('libxdamage' 'libx11' 'libxfixes' 'libxcomposite' 'gtk2' 'gtk3' 'glibc' 'glib2' 'zstd' 'at-spi2-core' 'mesa' 'libdrm' 'nss' \
    'expat' 'cairo' 'libxext' 'gcc-libs' 'zlib' 'libxrandr' 'libxcb' 'pango' 'dbus' 'libxkbcommon' 'alsa-lib' 'nspr' 'libcups')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('409a7aa4821e0bd57590c7bf2888e158f2e4384a8c38f3843b8c517cce0822a3')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr/local/lib/${pkgname%-bin}-0-1/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/electron/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed "s|Exec=/usr/local/lib/${pkgname%-bin}-0-1/bin/${pkgname%-bin}|Exec=/opt/${pkgname%-bin}/bin/${pkgname%-bin}|g" \
        -i "${pkgdir}/opt/${pkgname%-bin}/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/ui/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}