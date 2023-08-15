# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kiwiirc-desktop-bin
_appname="Kiwi IRC"
pkgver=1.7.0
pkgrel=3
pkgdesc="Next generation of the Kiwi IRC web client"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://kiwiirc.com/"
_githuburl="https://github.com/kiwiirc/kiwiirc"
license=('Apache')
provides=("${pkgname%-desktop-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-desktop-bin}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_armv7l.deb")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('0d7be737f12933bc5cd596c564df9bba5e3a15aefde284ef078861914ba7b477')
sha256sums_armv7h=('ca8521d2ec32ff46e704c066edd674512bacfb934d5bb0a55f30a320db42119e')
sha256sums_aarch64=('439f5c22df0260d4d7f599e94d532f3f842951a70aaf46121c025be48d90397f')
sha256sums_x86_64=('89c9bc3b7e17c5592c5b270d68d597fe9e2a6e46905e9420afc82468bd3abdb9')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|chat|Network|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}