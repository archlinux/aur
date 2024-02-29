# Maintainer: sandboiii <archlinux at sandboiii dot xyz>
# Contributor: VHSgunzo <vhsgunzo.github.io>

pkgname='vkteams-bin'
pkgbasename='vkteams'
pkgver=24.1.0.39689
pkgrel=2
pkgdesc='Official desktop application for the VK Teams messaging service'
arch=("x86_64")
url='https://dl.internal.myteam.mail.ru'
provides=("${pkgbasename}")
conflicts=("${pkgbasename}")
source=("${pkgbasename}.tar.xz::https://vkteams-www.hb.bizmrg.com/linux/x64/${pkgver}/${pkgbasename}.tar.xz"
        "${pkgbasename}.sh"
        "${pkgbasename}.png"
        "${pkgbasename}.desktop")
sha256sums=('117a0692e95080c623d3f0feb35f36b9957745a342dedd8e2b2c35f8ed5a85b1'
            'a2afc2dbd79e67736511c91b3d8f0a5fe3800c929ead9909d1b8f90fe7a7ca4b'
            'f4d3d9c11bcfd458a44f6e555bd753284b680c25977ddcfdf6039ea3ba65a75a'
            '72e1ea7734ff394278a2593b0f630e07dbbc4f51726118c9afb043078f10d93b')
options=('!strip')
optdepends=('hunspell: spell checker'
            'hunspell-ru: проверка орфографии')

shopt -s extglob

package() {
    install -dm755 "$pkgdir/opt/${pkgbasename}"
    install -dm755 "$pkgdir/usr/bin"
    cp -ar --no-preserve=ownership "$srcdir"/!(${pkgbasename}.desktop|${pkgbasename}.tar.xz|${pkgbasename}.sh|${pkgbasename}.png) "$pkgdir/opt/${pkgbasename}"
    rm -rf "$pkgdir/opt/${pkgbasename}/unittests"
    rm -f "$pkgdir/opt/${pkgbasename}/lib/libXcursor.so.1"
    install -Dm755 "../${pkgbasename}.sh" "$pkgdir/usr/bin/${pkgbasename}"
    install -Dm644 "../${pkgbasename}.desktop" "$pkgdir/usr/share/applications/${pkgbasename}.desktop"
    install -Dm644 "../${pkgbasename}.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgbasename}.png"
}
