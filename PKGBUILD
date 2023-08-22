# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=daoniu-electron-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="一个基于 Electron 编写的知犀思维导图非官方 PC 客户端，为 Linux 用户量身打造。"
arch=("x86_64")
url="https://github.com/pokon548/daoniu-electron"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-amd64-${pkgver}.zip"
    "${pkgname%-bin}.sh")
sha256sums=('782731d2b6fbb42a324ea7d6493c30c958a1da5b0235fe4f3afa3fc61e530025'
            'fe921d89233d1e26d7c99542080a6c1b0b91cc4a7f053f210801260c186c0178')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}/"
    cp -r "${srcdir}/resources/"* "${pkgdir}/opt/${pkgname%-bin}/"
    gendesk -f -n --categories "Utility" --name "道牛 ${pkgname%-bin}" --exec "${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/resources/app.asar.unpacked/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}