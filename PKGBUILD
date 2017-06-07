# Maintainer: Felix Laurie von Massenbach <felix@erbridge.co.uk>
pkgname=inky
pkgver=0.7.2
pkgrel=1
pkgdesc="Editor for ink: inkle's narrative scripting language"
arch=('x86_64')
url="http://www.inklestudios.com/ink"
license=('MIT')
makedepends=('gendesk')
source=("https://github.com/inkle/inky/releases/download/${pkgver}/Inky_linux.zip"
        "${pkgname}.png::https://github.com/inkle/inky/raw/${pkgver}/resources/Icon1024.png")
md5sums=('cf1f3b5b1bb062a51f12b9def646526c'
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
