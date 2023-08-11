# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chord-bin
pkgver=0.2.40
pkgrel=8
pkgdesc="A Modern Music Player.弦 - 一个现代音乐播放器,提供很多音乐服务商/播客的服务,也支持本地音乐文件的播放."
arch=('x86_64')
url="https://github.com/PeterDing/chord"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'electron18' 'bash')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.pacman"
  "LICENSE::https://raw.githubusercontent.com/PeterDing/chord/master/LICENSE"
  "${pkgname%-bin}.sh")
sha256sums=('5eaf015a5634c29b0dcf3192b226eaa96f7a247ccd23af366dffdd6204e41378'
            'aab9ba9322a4e18a0018d15f83b99c7b10d77d5e301579fc249efef89bc2836c'
            '59513c4e89f0e230b9a67a9efe240d07698ec61d588c7b839b8e8e1714215c1e')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/opt/${pkgname%-bin}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed "s|=Music|=AudioVideo|g;s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    cp -r "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"
}