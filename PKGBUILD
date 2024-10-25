# Maintainer: sandboiii <archlinux at sandboiii dot xyz>
# Contributor: VHSgunzo <vhsgunzo.github.io>

pkgname='vkteams-bin'
pkgbasename='vkteams'
pkgver=24.5.4.46643
pkgrel=1
pkgdesc='Official desktop application for the VK Teams messaging service'
arch=("x86_64")
url='https://teams.vk.com'
provides=("${pkgbasename}")
conflicts=("${pkgbasename}")
source=("${pkgbasename}-${pkgver}.tar.xz::https://vkteams-www.hb.bizmrg.com/linux/x64/${pkgver}/${pkgbasename}.tar.xz"
        "${pkgbasename}.sh"
        "${pkgbasename}.png"
        "${pkgbasename}.desktop"
        "${pkgbasename}mailto.desktop")
sha256sums=('71aa7c544eb0b27aa856afdb101bdf97fa2dc9a0cf7b5086383e66a0af7598c4'
            'a2afc2dbd79e67736511c91b3d8f0a5fe3800c929ead9909d1b8f90fe7a7ca4b'
            'f4d3d9c11bcfd458a44f6e555bd753284b680c25977ddcfdf6039ea3ba65a75a'
            '77c676b46bcedc418289c61e7ddab21f3a4dc76aafacef06722735161e493e09'
            'c6d4de65eb02cf243f1684d6be7e8e3094ce9da85e15e8a8ea132c6895f3a7a0')
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
    install -Dm644 "../${pkgbasename}mailto.desktop" "$pkgdir/usr/share/applications/${pkgbasename}mailto.desktop"
    install -Dm644 "../${pkgbasename}.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgbasename}.png"
}
