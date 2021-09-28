# Maintainer: Miepee <janbidler00 at tutanota dot com>
pkgname=crazy-space-taxi
pkgver=1.0
pkgrel=1
pkgdesc="C64 Space Taxi meets Crazy Taxi. Blaze through the city. A game made by DoctorM64"
arch=(x86_64)
url="https://doctorm64.itch.io/crazy-space-taxi"
license=('none')
depends=('glibc' 'gcc-libs')

source=("$pkgname-$pkgver.zip::https://matix.li/d6d082e1963f" "icon.png::https://cdn.discordapp.com/attachments/885758931803193344/892343567639527464/cstaxi.png")
sha256sums=("7917d78921f6fc903bedbef86c0aca612b6d62cc7060da29270655aa6b80188e" "64d192ab0ed6f00cbd1e30ad5d391ed03ea6e5729335c705764a9aa1a3def444")

package() {
    # remove orphaned file and replace icon symlink
    rm -f $pkgname-$pkgver.zip
    cp --remove-destination "$(readlink icon.png)" icon.png

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/opt/$pkgname/"
    cp -r ./ "$pkgdir/opt/$pkgname"
    chmod +x "$pkgdir/opt/$pkgname/cstaxi$(echo $pkgver | sed "s/\.//g").$CARCH"

    #creating shell script cause unity dumb
    echo "#! /usr/bin/sh
/opt/$pkgname/cstaxi$(echo $pkgver | sed "s/\.//g").$CARCH" > "$pkgdir/opt/$pkgname/startCSTaxi.sh"

    chmod +x "$pkgdir/opt/$pkgname/startCSTaxi.sh"

    ln -sf "/opt/$pkgname/startCSTaxi.sh" "$pkgdir/usr/bin/$pkgname"

        # Adding desktop entry
    mkdir -p "$pkgdir/usr/share/applications/"
    echo "[Desktop Entry]
Type=Application
Categories=Game
Encoding=UTF-8
Name=Crazy Space Taxi
Comment=C64 Space Taxi meets Crazy Taxi. Blaze through the city. Deliver your passengers before your shift ends!
Exec=$pkgname
Icon=/opt/$pkgname/icon.png
Terminal=false" > "$pkgdir/usr/share/applications/$pkgname.desktop"
}
