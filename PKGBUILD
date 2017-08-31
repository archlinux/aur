# Maintainer: Felix Laurie von Massenbach <felix@erbridge.co.uk>
pkgname=inky
pkgver=0.8.0
pkgrel=1
pkgdesc="Editor for ink: inkle's narrative scripting language"
arch=('x86_64')
url="http://www.inklestudios.com/ink"
license=('MIT')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.zip::https://github.com/inkle/inky/releases/download/${pkgver}/Inky_linux.zip"
        "${pkgname}-${pkgver}.png::https://github.com/inkle/inky/raw/${pkgver}/resources/Icon1024.png")
md5sums=('7cba44271a35f7fdaaf00a646f7f613a'
         '743b9bb1d15ce07cd533173992f7122d')

package() {
    gendesk -f --pkgname "${pkgname}" --pkgdesc "${pkgdesc}"

    install -D -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    install -d -m755 "${pkgdir}/usr/share/${pkgname}"

    cd "Inky-linux-x64"

    cp -a -r * "${pkgdir}/usr/share/${pkgname}"

    install -D -m755 Inky "${pkgdir}/usr/share/${pkgname}/Inky"

    install -d -m755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/Inky" "${pkgdir}/usr/bin/${pkgname}"
}
