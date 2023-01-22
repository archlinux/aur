# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='vkteams-bin'
pkgbasename='vkteams'
pkgver='22.10.1.24120'
pkgrel='1'
pkgdesc='Official desktop application for the VK Teams messaging service'
arch=("x86_64")
url='https://dl.internal.myteam.mail.ru'
provides=("${pkgbasename}")
conflicts=("${pkgbasename}")
source=("${pkgbasename}.tar.xz::https://dl.internal.myteam.mail.ru/downloads/linux/x64/latest/${pkgbasename}.tar.xz"
        "${pkgbasename}.sh"
        "${pkgbasename}.png"
        "${pkgbasename}.desktop")
sha256sums=('b3b7fb4e1e95802ebac1256985e640de3b8b7c807fd56bdc539f9e7f0028c50e'
            'a2afc2dbd79e67736511c91b3d8f0a5fe3800c929ead9909d1b8f90fe7a7ca4b'
            'f4d3d9c11bcfd458a44f6e555bd753284b680c25977ddcfdf6039ea3ba65a75a'
            '72e1ea7734ff394278a2593b0f630e07dbbc4f51726118c9afb043078f10d93b')
options=('!strip')

shopt -s extglob

package() {
    install -dm755 "$pkgdir/opt/${pkgbasename}"
    install -dm755 "$pkgdir/usr/bin"
    cp -ar --no-preserve=ownership "$srcdir/"!(${pkgbasename}.desktop|${pkgbasename}.tar.xz|${pkgbasename}.sh|${pkgbasename}.png) "$pkgdir/opt/${pkgbasename}"
    rm -rf "$pkgdir/opt/${pkgbasename}/unittests"
    install -Dm755 "../${pkgbasename}.sh" "$pkgdir/usr/bin/${pkgbasename}"
    install -Dm644 "../${pkgbasename}.desktop" "$pkgdir/usr/share/applications/${pkgbasename}.desktop"
    install -Dm644 "../${pkgbasename}.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgbasename}.png"
}
