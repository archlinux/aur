# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=commas-bin
_appname=Commas
pkgver=0.26.0
pkgrel=2
pkgdesc="A hackable, pluggable terminal, and also a command runner."
arch=("x86_64")
url="https://github.com/CyanSalt/commas"
license=('ISC')
depends=('libdrm' 'expat' 'alsa-lib' 'glibc' 'cairo' 'nss' 'libxext' 'pango' 'gtk3' 'libxkbcommon' 'glib2' 'libcups' 'gcc-libs' \
    'libxfixes' 'java-runtime' 'at-spi2-core' 'libxcomposite' 'libxrandr' 'nspr' 'libxdamage' 'dbus' 'sh' 'libxcb' 'mesa' 'libx11')
makedepends=('gendesk')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_appname}-linux-x64.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/CyanSalt/commas/master/resources/images/icon.png")
sha256sums=('52a032e42d748a14c7e852469b31092614d88e7b37d6024bba96b41374d15872'
            '65b65c25d8d68549dc271f7c755426ba8884f6ae9fb3a8061eec65c241345f48')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${_appname}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${_appname}" --exec "/opt/${pkgname%-bin}/${_appname} --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}