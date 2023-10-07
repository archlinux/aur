# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chengla-linux-unofficial-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="橙啦平台的非官方 Linux 客户端"
arch=("x86_64")
url="https://github.com/pokon548/chengla-for-linux"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26')
makedepends=('gendesk' 'asar')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-amd64-${pkgver}.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/pokon548/chengla-for-linux/v${pkgver}/build/icon.png"
    "${pkgname%-bin}.sh")
sha256sums=('aea9756f511e57b8393cfe3a3cf00406b845427b5df200286482471caf908741'
            '68f7eb0a77a9c1422bb3e12a9791495a017d08f813b809dbd6d0e4b4e1fbcfb1'
            '22b5956672dbb2af703e3f46e69713654b2bcfde354829c9bea5bc276cb15aed')
build() {
    asar extract "${srcdir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" "${srcdir}/app.asar.unpacked/resources/icon.png"
    asar pack "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    gendesk -q -f -n --categories "Utility" --name "chengla-linux橙啦" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}