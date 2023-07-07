# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="chord-bin"
pkgver=0.2.40
pkgrel=6
pkgdesc="Chord - A Modern Music Player"
arch=('x86_64')
url="https://github.com/PeterDing/chord"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'electron')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.pacman"
  "LICENSE::https://raw.githubusercontent.com/PeterDing/chord/master/LICENSE"
  "${pkgname%-bin}.sh")
sha256sums=('5eaf015a5634c29b0dcf3192b226eaa96f7a247ccd23af366dffdd6204e41378'
            'aab9ba9322a4e18a0018d15f83b99c7b10d77d5e301579fc249efef89bc2836c'
            'd7898a0dda701cda08ff8eedbf1d10782427bfd75f9de3efe45246946570705b')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/opt/${pkgname%-bin}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed "s|=Music|=AudioVideo|g;s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    cp -r "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"
}