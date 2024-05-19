pkgname=adventuresofdemo
_pkgname=AdventuresofDemo
pkgver=1.0.2
pkgrel=2
pkgdesc="This is a small game based on the TheXTech engine with the A2XT content pack made by the Talkhaus community. It's a remix of old SMBX episodes such as The Invasion 1, brought to the A2XT universe!"
arch=('pentium4' 'i386' 'i686' 'x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/adventuresofdemo"
license=('GPL')
depends=('thextech-bin' 'adventuresofdemo-assets' 'wget' 'unzip' 'yad')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/theadventuresofdemo-$pkgver.tar.bz2")
sha256sums=('ca66c313365b1c17e4900df2fe536034dd56971ed3b65e125d32c80f17b547c4')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    cd $srcdir
    for dir in adventuresofdemo-*/ ; do cp -r "${dir}" "$pkgname" ;done
    cp -r "$srcdir/$pkgname/$pkgname.png" "$pkgdir/usr/share/pixmaps"
    cp -r "$srcdir/$pkgname/." "$pkgdir/usr/share/games/$_pkgname"
    install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin"  

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
