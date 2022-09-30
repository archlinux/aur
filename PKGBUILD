# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='vkteams-bin'
pkgbasename='vkteams'
pkgver='22.8.021679'
pkgrel='1'
pkgdesc='Official desktop application for the VK Teams messaging service'
arch=("x86_64")
url='https://dl.internal.myteam.mail.ru'
provides=("${pkgbasename}")
conflicts=("${pkgbasename}")
source=("${pkgbasename}-${pkgver}.tar.xz::https://dl.internal.myteam.mail.ru/downloads/linux/x64/latest/${pkgbasename}.tar.xz"
        "${pkgbasename}.sh"
        "${pkgbasename}.png"
        "${pkgbasename}.desktop")
sha256sums=('5bc3f7ad3b0890ac8ce96d122840fae952071f31cf08a12929147ff60c4ee50a'
            'a2afc2dbd79e67736511c91b3d8f0a5fe3800c929ead9909d1b8f90fe7a7ca4b'
            '455842f3b3045a590e03372ae1f9ca75fc935d2cc829c379eaf01acefba97d68'
            '72e1ea7734ff394278a2593b0f630e07dbbc4f51726118c9afb043078f10d93b')
options=('!strip')

shopt -s extglob

package() {
    install -dm755 "$pkgdir/opt/${pkgbasename}"
    install -dm755 "$pkgdir/usr/bin"
    cp -ar "$srcdir/"!(${pkgbasename}.desktop|${pkgbasename}-${pkgver}.tar.xz|${pkgbasename}.sh|${pkgbasename}.png) "$pkgdir/opt/${pkgbasename}"
    rm -rf "$pkgdir/opt/${pkgbasename}/unittests"
    install -Dm755 "../${pkgbasename}.sh" "$pkgdir/usr/bin/${pkgbasename}"
    install -Dm644 "../${pkgbasename}.desktop" "$pkgdir/usr/share/applications/${pkgbasename}.desktop"
    install -Dm644 "../${pkgbasename}.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgbasename}.png"
}
