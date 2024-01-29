pkgname=adventuresofdemo
_pkgname=AdventuresofDemo
pkgver=1.0.1
pkgrel=1
pkgdesc="This is a small game based on the TheXTech engine with the A2XT content pack made by the Talkhaus community. It's a remix of old SMBX episodes such as The Invasion 1, brought to the A2XT universe!"
arch=('pentium4' 'i386' 'i686' 'x86_64' 'aarch64')
url="https://gitlab.com/thextech-archive/aod-script"
license=('GPL')
depends=('thextech-bin' 'adventuresofdemo-assets' 'wget' 'unzip' 'yad')
makedepends=('unzip')
source=("https://gitlab.com/thextech-archive/aod-script/-/archive/$pkgver-$pkgrel/aod-script-$pkgver-$pkgrel.tar.bz2")
sha256sums=("SKIP")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    for dir in aod-*/ ; do mv "${dir}" "$_pkgname" ;done
    cp -r "$srcdir/$_pkgname/$pkgname.png" "$pkgdir/usr/share/pixmaps"
    cp -r "$srcdir/$_pkgname/." "$pkgdir/usr/share/games/$_pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
