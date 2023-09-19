# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=prospect-mail
pkgname="${_pkgname}-beta-bin"
_appname="Prospect Mail"
pkgver=0.5.0_beta1
pkgrel=1
pkgdesc="The Outlook desktop client for the new Outlook Interface from Microsoft 365."
arch=("aarch64" "armv7h" "x86_64")
url="https://github.com/julian-alarcon/prospect-mail"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${pkgname%-bin}")
depends=('hicolor-icon-theme' 'libxdamage' 'libxfixes' 'libx11' 'libxext' 'at-spi2-core' 'libcups' 'libxrandr' 'mesa' 'pango' 'glibc' \
    'libxcomposite' 'expat' 'libxkbcommon' 'gcc-libs' 'nss' 'gtk3' 'libdrm' 'alsa-lib' 'libxcb' 'cairo' 'glib2' 'dbus' 'nspr')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pacman::${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}-aarch64.pacman")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.pacman::${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}-armv7l.pacman")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pacman::${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.pacman")
source=("LICENSE::https://raw.githubusercontent.com/julian-alarcon/prospect-mail/v${pkgver//_/-}/LICENSE")
sha256sums=('d0e5830cefea162e44ae617ea67300234f69b9fc9c2c9e220ad2b56f9cc189df')
sha256sums_aarch64=('d6bdb006c8d7fe533b3ba22b82f0d9d84894cc6a0a093f41af5711018d48f0e7')
sha256sums_armv7h=('ee8807fd6e30dedb6a61857f705facf0a51295360eedc9d8759dc0d02967ff0b')
sha256sums_x86_64=('5e6540ccfc4f4f563406ec1a7c682386ca4feb36590981e05f3274489c4a2f21')
build() {
    sed "s|\"/opt/${_appname}/${_pkgname}\"|${pkgname%-bin} --no-sandbox|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_appname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"    
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}