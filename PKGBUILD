# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-music
pkgver=0.3.4
pkgrel=1
pkgdesc="Light music.轻音乐"
arch=('any')
url="https://simple-music.netlify.app/"
_githuburl="https://github.com/joey2217/simple-music"
license=('MIT')
conflicts=("${pkgname}")
depends=('electron')
makedepends=('gendesk' 'pnpm')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('66f0c5e029d1ebdc005b9a5832ab11b388fc58fe24e2776edc3c13a74d80eee7'
            '1fa0ddc32cabb06852f44ad1aef512db4a0e5d2bfa3bfba4c7fc2b821b1468c8')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    pnpm install
    pnpm run package -l
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --icon "${pkgname}" --categories "AudioVideo" --name "SimpleMusic轻音乐" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}