# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=orature-bin
_pkgname=Orature
pkgver=1.9.1
pkgrel=2
pkgdesc="An application for creating Narrations and Translations of Audio Bibles, Books, Resources, Commentaries, etc."
arch=("x86_64")
url="https://github.com/Bible-Translation-Tools/Orature"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libx11' 'alsa-lib' 'glibc' 'libxrender' 'libxext' 'libxtst' 'libxi' 'sh' 'java-runtime')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}+6281.deb")
sha256sums=('683c0adc6e2183be5ff835487a2e90786e0e3e4349003dbc217f4c08dd7617f6')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    find "${srcdir}/opt/${pkgname%-bin}/jre" -type f -exec chmod a-w {} \;
    find "${srcdir}/opt/${pkgname%-bin}/jre" -type d -exec chmod 755 {} \;
    gendesk -q -f -n --categories "Development" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/.install4j/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}