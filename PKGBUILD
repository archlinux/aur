# Maintainer: Miepee <janbidler00 at tutanota dot com>
pkgname=skippythebot
pkgver=1.15
pkgrel=1
pkgdesc="Skippy is on an epic quest to unravel its true destiny. A game made by DoctorM64."
arch=(x86_64)
url="https://doctorm64.itch.io/skippybot"
license=('none')
depends=('glibc' 'gcc-libs')
makedepends=('wget')
source=("https://matix.li/235665d69843")
md5sums=(SKIP)

build() {
    # remove orphaned file
    rm -f $(echo $source | sed "s/https:\/\/matix.li\///g")
}

package() {
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/opt/skippythebot/"
    cp -r ./ "$pkgdir/opt/skippythebot"
    chmod +x "$pkgdir/opt/skippythebot/skippy_$(echo $pkgver | sed "s/\.//g").$CARCH"

    #creating shell script cause unity dumb
    echo "#! /usr/bin/sh
/opt/skippythebot/skippy_$(echo $pkgver | sed "s/\.//g").$CARCH" > "$pkgdir/opt/skippythebot/startSkippy.sh"

    chmod +x "$pkgdir/opt/skippythebot/startSkippy.sh"

    ln -sf "/opt/skippythebot/startSkippy.sh" "$pkgdir/usr/bin/skippythebot"

    # downloading icon
    # thanks to Zacrabo for creating the icon
    wget -O "$pkgdir/opt/skippythebot/icon.png" "https://cdn2.steamgriddb.com/file/sgdb-cdn/icon/94739e5a5164b4d2396e253a11d57044/4/64x64.png"

        # Adding desktop entry
    mkdir -p "$pkgdir/usr/share/applications/"
    echo "[Desktop Entry]
Type=Application
Categories=Game
Encoding=UTF-8
Name=Skippy the Bot
Comment=Skippy is on an epic quest to unravel its true destiny.
Exec=skippythebot
Icon=/opt/skippythebot/icon.png
Terminal=false" > "$pkgdir/usr/share/applications/skippythebot.desktop"
}
