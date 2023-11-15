# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kiwiirc-desktop-bin
_appname="Kiwi IRC"
pkgver=1.7.1
pkgrel=2
pkgdesc="Next generation of the Kiwi IRC web client"
arch=(
    'armv7h'
    'aarch64'
    'x86_64'
)
url="https://kiwiirc.com/"
_ghurl="https://github.com/kiwiirc/kiwiirc"
license=('Apache')
provides=("${pkgname%-desktop-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-desktop-bin}")
depends=(
    'electron25'
    'hicolor-icon-theme'
)
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-2_linux_armv7l.deb")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-2_linux_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-2_linux_amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('de62ed6306328b9c24eafc0335f3b042efc2ecfe77450692b2b04e0f86c4eb95')
sha256sums_armv7h=('52b315f259afac82cc29c362addb3e9ee13362a9533619471d1b51110e310099')
sha256sums_aarch64=('e6735265dd06b5b76254dd00e54a6253468b8eb2c9306c3189143b47a42c4c6d')
sha256sums_x86_64=('94c71d9d625b4efae0b4862a1702bd6b18fe942cf2834196e43c5121dd5d7213')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g;s|chat|Network|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}