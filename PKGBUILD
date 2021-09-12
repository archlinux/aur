# Maintainer: Miepee <janbidler00 at tutanota dot com>
pkgname=skippythebot
pkgver=1.15
pkgrel=2
pkgdesc="Skippy is on an epic quest to unravel its true destiny. A game made by DoctorM64."
arch=(x86_64)
url="https://doctorm64.itch.io/skippybot"
license=('none')
depends=('glibc' 'gcc-libs')
# thanks to Zacrabo for creating the icon
source=("$pkgname-$pkgver.zip::https://matix.li/235665d69843" "icon.png::https://cdn2.steamgriddb.com/file/sgdb-cdn/icon/94739e5a5164b4d2396e253a11d57044/4/64x64.png")
md5sums=("928d3d8ed5df563fb3d06110849a7990" "d2812fc3bafd0ba12a413fd43f104e11")

package() {
    # remove orphaned file and replace icon symlink
    rm -f $pkgname-$pkgver.zip
    cp --remove-destination "$(readlink icon.png)" icon.png

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/opt/$pkgname/"
    cp -r ./ "$pkgdir/opt/$pkgname"
    chmod +x "$pkgdir/opt/$pkgname/skippy_$(echo $pkgver | sed "s/\.//g").$CARCH"

    #creating shell script cause unity dumb
    echo "#! /usr/bin/sh
/opt/$pkgname/skippy_$(echo $pkgver | sed "s/\.//g").$CARCH" > "$pkgdir/opt/$pkgname/startSkippy.sh"

    chmod +x "$pkgdir/opt/$pkgname/startSkippy.sh"

    ln -sf "/opt/$pkgname/startSkippy.sh" "$pkgdir/usr/bin/$pkgname"

        # Adding desktop entry
    mkdir -p "$pkgdir/usr/share/applications/"
    echo "[Desktop Entry]
Type=Application
Categories=Game
Encoding=UTF-8
Name=Skippy the Bot
Comment=Skippy is on an epic quest to unravel its true destiny.
Exec=$pkgname
Icon=/opt/$pkgname/icon.png
Terminal=false" > "$pkgdir/usr/share/applications/$pkgname.desktop"
}
