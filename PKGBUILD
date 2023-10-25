# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=commas-bin
_pkgname=Commas
pkgver=0.29.2
pkgrel=1
pkgdesc="A hackable, pluggable terminal, and also a command runner."
arch=("x86_64")
url="https://github.com/CyanSalt/commas"
license=('ISC')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libdrm' 'expat' 'alsa-lib' 'glibc' 'cairo' 'nss' 'libxext' 'pango' 'gtk3' 'libxkbcommon' 'glib2' 'libcups' 'gcc-libs' 'python' \
    'libxfixes' 'java-runtime' 'at-spi2-core' 'libxcomposite' 'libxrandr' 'nspr' 'libxdamage' 'dbus' 'sh' 'libxcb' 'mesa' 'libx11')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/CyanSalt/commas/v${pkgver}/resources/images/icon.png")
sha256sums=('4fb478381d9fc48f55438fe861aebf26639949369c8f7e63f2ef3dcf0e83f74a'
            '65b65c25d8d68549dc271f7c755426ba8884f6ae9fb3a8061eec65c241345f48')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin} --no-sandbox %U"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${_pkgname}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}