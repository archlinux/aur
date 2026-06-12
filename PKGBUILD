# Maintainer: Dylan Delgado <dylan1496 at live dot com>
pkgname=inky-bin
pkgname2=inky
pkgver=0.15.2
pkgrel=1
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
sha512sums=('ff4a2cfcaea6a469aad926756b55e16afc02de27145ff6a41ab4b2e6a4680d212bf3bd5a21acc2065b9255c0926b1e48daf6b57f445c39cc899e69b1f0ff8da2'
            '9b88362b61635a2328bd2439aaeca7b26875e158b3c15f7317d0f0f26306891f48d147cd1d63602e36ee249880c0b500397a20cdff14e090a699925f37e18ef9'
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
