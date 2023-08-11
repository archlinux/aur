# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fishpi-bin
pkgver=1.3.5
pkgrel=4
pkgdesc="摸鱼派新版客户端"
arch=('x86_64')
url="https://fishpi.cn"
_githuburl="https://github.com/imlinhanchao/fishpi-desktop"
license=('custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('electron16' 'bash')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/imlinhanchao/fishpi-desktop/master/build/icons/256x256.png"
    "LICENSE.html::${url}/privacy"
    "${pkgname%-bin}.sh")
sha256sums=('87dad81ad2f57bb136254df8c52e06613e24d296ce3aa39b722b6271dd6c44f5'
            'c8d477f31fadf5c61c54afbc28ddf06af73dfa062b53ce70c47e1092eb05bc94'
            '16a66abe0ab4fc15180c6eb7fcd2ea85fd285d9ec5da4200dc0b255951188831'
            'c39285c5405671666a72e32daa9113444fc70a09559621acaace4e5ebed83051')
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-linux/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
   gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "摸鱼派fishpi" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
   install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
   install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}