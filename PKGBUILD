# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kiwiirc-desktop-bin
_appname="Kiwi IRC"
pkgver=1.7.1
pkgrel=1
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
sha256sums_armv7h=('c13264bc11c4618ee10571abe713cd368e5be8aa120f88a4ce1f45870defc799')
sha256sums_aarch64=('4a710e2b416cc1c2d274af7d3d9191cb106e1fa5e6eb957bf804cabfd7c92744')
sha256sums_x86_64=('9a6ce6f3ca4e539beebaa392253c79cdc92a93790bc57879d58b64dc16e362f6')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g;s|chat|Network|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}