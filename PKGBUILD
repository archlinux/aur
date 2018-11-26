# Maintainer: Renato Molnar <m dot renato93 at gmail dot com>

pkgbase=notepadpp
pkgname=("notepadpp" "notepadpp-win32")
pkgver=7.6
pkgrel=1
pkgdesc="A free source code editor for windows"
arch=('x86_64')
url="https://notepad-plus-plus.org/"
license=('GPL2')
depends=('wine' 'sh')
makedepends=('unzip')
source=(notepadpp
        notepadpp.desktop
        notepadpp.png
        "https://notepad-plus-plus.org/repository/${pkgver%%.*}.x/${pkgver}/npp.${pkgver}.bin.zip"
        "https://notepad-plus-plus.org/repository/${pkgver%%.*}.x/${pkgver}/npp.${pkgver}.bin.x64.zip")

noextract=("npp.${pkgver}.bin.zip"
           "npp.${pkgver}.bin.x64.zip")

sha256sums=('23c83aa671be37dae7ea773a5cb43727ed22b985c763069fb3b6747cf2242434'
            'a1c34d444893d56ae165c8457260e11b729ea2afc10bb9e2690bc89e1f523238'
            '04c8ad254a41350078bba4d56ad54f7b4c0df125029aee021ea0ac632971ebad'
            '8ba730272708717fa8b85d1c7d20887f33c9ce14979e2539dd73f165f351a712'
            '3411a4437077c5d10d3a5fbf79853c33c52ac66b565e0f94d10e7483e864a8bd')

options=('!strip')

package_notepadpp() {
    pkgdesc+=" (64-bit)"
    arch=('x86_64')
    conflicts=("notepadpp-win32")
    provides=("notepadpp")

    install -d -m755 "$pkgdir/usr/share/$pkgbase"

#    if [ "${CARCH}" == i686 ]; then
#        unzip "npp.${pkgver}.bin.zip" -d "$pkgdir/usr/share/$pkgbase"
#    elif [ "${CARCH}" == x86_64 ]; then
     unzip "npp.${pkgver}.bin.x64.zip" -d "$pkgdir/usr/share/$pkgbase"
#    fi

    rm -rf "$pkgdir/usr/share/$pkgbase/updater" \
           "$pkgdir/usr/share/$pkgbase/license.txt" \

    find "$pkgdir/usr/share/$pkgbase" -type d -exec chmod 755 "{}" \;
    find "$pkgdir/usr/share/$pkgbase" -type f -exec chmod 644 "{}" \;

    install -D -m755 notepadpp "$pkgdir/usr/bin/notepadpp"
    install -D -m644 notepadpp.png "$pkgdir/usr/share/pixmaps/notepadpp.png"
    install -D -m644 notepadpp.desktop "$pkgdir/usr/share/applications/notepadpp.desktop"
}

package_notepadpp-win32() {
    pkgdesc+=" (32-bit)"
    arch=("x86_64")
    conflicts=("notepadpp")
    provides=("notepadpp")

    install -d -m755 "$pkgdir/usr/share/$pkgbase"

    unzip "npp.${pkgver}.bin.zip" -d "$pkgdir/usr/share/$pkgbase"

    rm -rf "$pkgdir/usr/share/$pkgbase/updater" \
           "$pkgdir/usr/share/$pkgbase/license.txt" \

    find "$pkgdir/usr/share/$pkgbase" -type d -exec chmod 755 "{}" \;
    find "$pkgdir/usr/share/$pkgbase" -type f -exec chmod 644 "{}" \;

    install -D -m755 notepadpp "$pkgdir/usr/bin/notepadpp"
    install -D -m644 notepadpp.png "$pkgdir/usr/share/pixmaps/notepadpp.png"
    install -D -m644 notepadpp.desktop "$pkgdir/usr/share/applications/notepadpp.desktop"
}
