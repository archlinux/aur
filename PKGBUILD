# Maintainer: Renato Molnar <m dot renato93 at gmail dot com>

pkgname=notepadpp
pkgver=7.5.9
pkgrel=1
pkgdesc="A free source code editor."
arch=('i686' 'x86_64')
url="https://notepad-plus-plus.org/"
license=('GPL2')
depends=('wine' 'sh')
makedepends=('unzip')
source=(notepadpp
        notepadpp.desktop
        notepadpp.png)
source_i686=("notepad-plus-plus.bin.zip"::"https://notepad-plus-plus.org/repository/${pkgver%%.*}.x/${pkgver}/npp.${pkgver}.bin.zip")
source_x86_64=("notepad-plus-plus.bin.zip"::"https://notepad-plus-plus.org/repository/${pkgver%%.*}.x/${pkgver}/npp.${pkgver}.bin.x64.zip")

noextract=("notepad-plus-plus.bin.zip")

sha256sums=('e78cf94d8bd24f692b1e9351988054b9d0128d39b58363df94233d2a1bd1ad40'
            'a1c34d444893d56ae165c8457260e11b729ea2afc10bb9e2690bc89e1f523238'
            '04c8ad254a41350078bba4d56ad54f7b4c0df125029aee021ea0ac632971ebad')
sha256sums_i686=('20e1b85d7081f7def11a60d8540adb22b7d77e215da1b99f3768b9271cd6eed1')
sha256sums_x86_64=('8e31e7aa5c7a5280ec7a1f3ba456734fdc24cb2969a4b07af41b628459695a2c')
options=('!strip')

package() {
    install -d -m755 "$pkgdir/usr/share/$pkgname"

    unzip notepad-plus-plus.bin.zip -d "$pkgdir/usr/share/$pkgname"

    rm -rf "$pkgdir/usr/share/$pkgname/updater" \
           "$pkgdir/usr/share/$pkgname/license.txt" \

#    cp -r "$srcdir" "$pkgdir/usr/share/$pkgname"

    find "$pkgdir/usr/share/$pkgname" -type d -exec chmod 755 "{}" \;
    find "$pkgdir/usr/share/$pkgname" -type f -exec chmod 644 "{}" \;

    install -D -m755 notepadpp "$pkgdir/usr/bin/notepadpp"
    install -D -m644 notepadpp.png "$pkgdir/usr/share/pixmaps/notepadpp.png"
    install -D -m644 notepadpp.desktop "$pkgdir/usr/share/applications/notepadpp.desktop"
}
