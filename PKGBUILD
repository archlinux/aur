# Maintainer: Dylan Delgado <dylan1496 at live dot com>
pkgname=inky-bin
pkgname2=inky
pkgver=0.15.1
pkgrel=2
pkgdesc="Editor for ink: inkle's narrative scripting language - precompiled binary"
arch=('x86_64')
url="http://www.inklestudios.com/ink"
license=('MIT')
options=('!strip')
depends=('icu')
conflicts=('inky')
provides=('inky')
optdepends=('mono: for exporting to web and JSON')
source=("${pkgname}-${pkgver}.zip::https://github.com/inkle/inky/releases/download/${pkgver}/Inky_linux.zip"
        "${pkgname}-${pkgver}.png::https://github.com/inkle/inky/raw/${pkgver}/resources/Icon1024.png"
        "${pkgname2}.desktop")
sha512sums=('738b734aa1fa24d9ba09361c7ab5ca8b08a0e910724ef115d4c3d1d7a75f87c501d978da6830e617b961d7566b95d3b7bf358fc6e1b06dc3246a12e5deb96531'
            '4f465c45c1c61ede58db0a36682f575b7d755c9c28b0261a7892045813986d12f77d3d5c8881d9c476e07ca5169ed163c89f56a8a4049c6f0337db6cab3275e5'
            '84fd0f87bfdf5e1fd6df5f9e253e3aa71373b9ad28a1d027522eceb6cf94a9a370ef239bfe0738ce64efabb3685945fc40c054265418b0a639e26e4213211481')

package() {
    mv "${pkgname}-${pkgver}.png" "${pkgname2}-${pkgver}.png"
    install -D -m644 "${pkgname2}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 "${pkgname2}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    install -d -m755 "${pkgdir}/usr/share/${pkgname2}"

    cp -a -r * "${pkgdir}/usr/share/${pkgname2}"

    install -D -m755 Inky "${pkgdir}/usr/share/${pkgname2}/Inky"

    install -d -m755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname2}/Inky" "${pkgdir}/usr/bin/${pkgname2}"
}
