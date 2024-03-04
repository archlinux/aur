# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=alphabiz-bin
_pkgname=Alphabiz
pkgver=0.3.2
_electronversion=21
pkgrel=2
pkgdesc="Web3 ecosystem - enable developers to build fully decentralized media platform and blockchain-based marketplace"
arch=('x86_64')
url="https://alpha.biz/"
_ghurl="https://github.com/tanshuai/alphabiz"
license=('GPL-2.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'alsa-lib'
    'java-runtime'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.deb"
)
sha256sums=('939873dbe7cfa8aec08723f84139eac47ce38d7153c302fe3175435e608645ba')
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}