# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fishpi-bin
pkgver=1.3.5
pkgrel=2
pkgdesc="摸鱼派新版客户端"
arch=('x86_64')
url="https://fishpi.cn"
_githuburl="https://github.com/imlinhanchao/fishpi-desktop"
license=('custom')
depends=('electron16' 'bash')
makedepends=('gendesk')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/imlinhanchao/fishpi-desktop/master/build/icons/256x256.png"
    "LICENSE.html::${url}/privacy"
    "${pkgname%-bin}.sh")
sha256sums=('87dad81ad2f57bb136254df8c52e06613e24d296ce3aa39b722b6271dd6c44f5'
            'c8d477f31fadf5c61c54afbc28ddf06af73dfa062b53ce70c47e1092eb05bc94'
            '16a66abe0ab4fc15180c6eb7fcd2ea85fd285d9ec5da4200dc0b255951188831'
            '8dc20bc67f4d3435b8c1177a8f00d17e94996da0d531d144e86b4d7c15eec6f4')
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-linux/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
   gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "摸鱼派fishpi" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
   install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
   install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}