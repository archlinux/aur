# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pitv-bin
_appname=pitv
pkgver=1.1.1
pkgrel=1
pkgdesc="A cross-platform STB and IPTV player client"
arch=("x86_64")
url="https://ozankaraali.com/PiTV/"
_ghurl="https://github.com/ozankaraali/PiTV"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron22'
)
source=("${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/ozankaraali/PiTV/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('ae0b7dfb275404412e2ef1d04becd9c40abb7fc5b9a29e77c3a70a985986584c'
            '1473d16a8edb299025ac4faecc2b83570a5aca99e5ad66781b8492d2d328525e'
            'f3788f99f2a291e949b5f723619ec9edc0363d44da850a9f6578492477581bd3')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}