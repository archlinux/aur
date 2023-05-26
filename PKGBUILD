# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=orature-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="An application for creating Narrations and Translations of Audio Bibles, Books, Resources, Commentaries, etc."
arch=("x86_64")
url="https://github.com/Bible-Translation-Tools/Orature"
license=("GPL3")
conflicts=("${pkgname%-bin}")
depends=('libx11' 'alsa-lib' 'glibc' 'libxrender' 'libxext' 'libxtst' 'libxi' 'sh')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}+5108.deb")
sha256sums=('8d06e1f3ee4b9a0454100384e70d71c467d3f83c81ac587dbe8abb44148da797')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/.install4j/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f --icon "${pkgname%-bin}" --categories "Development" --name "Orature" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${pkgdir}/opt/${pkgname%-bin}/jre" -type f -exec chmod a-w {} \;
    find "${pkgdir}/opt/${pkgname%-bin}/jre" -type d -exec chmod 755 {} \;
}