# Maintainer: Renato Molnar <m dot renato93 at gmail dot com>

pkgbase=notepadpp
pkgname=("notepadpp-win64" "notepadpp-win32")
pkgver=7.6.6
pkgrel=1
pkgdesc="A free source code editor for Windows"
arch=('x86_64')
url="https://notepad-plus-plus.org/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('wine' 'sh')
makedepends=('unzip')
source=(notepadpp
        notepadpp.desktop
        notepadpp.png
        "https://notepad-plus-plus.org/repository/${pkgver%%.*}.x/${pkgver}/npp.${pkgver}.bin.zip"
        "https://notepad-plus-plus.org/repository/${pkgver%%.*}.x/${pkgver}/npp.${pkgver}.bin.x64.zip")

noextract=("npp.${pkgver}.bin.zip"
           "npp.${pkgver}.bin.x64.zip")

sha256sums=('849aebb1491c7243e5bb8069d57a69163ed1f47a71f033414a6794081b0e62ec'
            'a1c34d444893d56ae165c8457260e11b729ea2afc10bb9e2690bc89e1f523238'
            '04c8ad254a41350078bba4d56ad54f7b4c0df125029aee021ea0ac632971ebad'
            'de0812691154858382233c8957cb5d65c7db1e88430bed2383c3518c5d5c78ce'
            '92cf60d3ef54625ac32bb6ae7bc2889172bbd16cb5825ee14b1bffc1548291fe')

options=('!strip')

package_notepadpp-win64() {
    pkgdesc+=" (64-bit)"
    conflicts=("notepadpp")
    provides=("notepadpp")
    replaces=("notepadpp")

    install -d -m755 "${pkgdir}/usr/share/${pkgbase}"

    unzip "npp.${pkgver}.bin.x64.zip" -d "${pkgdir}/usr/share/${pkgbase}"

    rm -rf "${pkgdir}/usr/share/${pkgbase}/updater" \
           "${pkgdir}/usr/share/${pkgbase}/license.txt" \

    find "${pkgdir}/usr/share/${pkgbase}" -type d -exec chmod 755 "{}" \;
    find "${pkgdir}/usr/share/${pkgbase}" -type f -exec chmod 644 "{}" \;

    sed -i 's/sedversion/"${pkgver}-${pkgrel}"/' notepadpp

    install -D -m755 notepadpp "${pkgdir}/usr/bin/notepadpp"
    install -D -m644 notepadpp.png "${pkgdir}/usr/share/pixmaps/notepadpp.png"
    install -D -m644 notepadpp.desktop "${pkgdir}/usr/share/applications/notepadpp.desktop"
}

package_notepadpp-win32() {
    pkgdesc+=" (32-bit)"
    conflicts=("notepadpp")
    provides=("notepadpp")

    install -d -m755 "${pkgdir}/usr/share/${pkgbase}"

    unzip "npp.${pkgver}.bin.zip" -d "${pkgdir}/usr/share/${pkgbase}"

    rm -rf "${pkgdir}/usr/share/${pkgbase}/updater" \
           "${pkgdir}/usr/share/${pkgbase}/license.txt" \

    find "${pkgdir}/usr/share/${pkgbase}" -type d -exec chmod 755 "{}" \;
    find "${pkgdir}/usr/share/${pkgbase}" -type f -exec chmod 644 "{}" \;

    sed -i "s/SED_APPVER/${pkgver}-${pkgrel}/" notepadpp

    install -D -m755 notepadpp "${pkgdir}/usr/bin/notepadpp"
    install -D -m644 notepadpp.png "${pkgdir}/usr/share/pixmaps/notepadpp.png"
    install -D -m644 notepadpp.desktop "${pkgdir}/usr/share/applications/notepadpp.desktop"
}
