pkgname=smbx
_pkgname=SMBX
pkgver=1.0.0
pkgrel=1
pkgdesc="Super Mario Bros. X is a Mario fan game originally made by Andrew Spinks in the year 2009 and supported by him up to 2011. This game combines various aspects of Super Mario Bros., Super Mario Bros. 2, Super Mario Bros. 3, Super Mario World, and other Mario games."
arch=('pentium4' 'i386' 'i686' 'x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/smbx"
license=('GPL')
depends=('thextech-bin' 'smbx-assets' 'wget' 'unzip' 'yad')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/smbx-$pkgver.tar.bz2")
sha256sums=('63506e3f44e4c44e0f830b72e449d1fc99c602fb3a340085a6ae61105df7d2a1')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    for dir in smbx-*/ ; do mv "${dir}" "$pkgname" ;done
    cp -r "$srcdir/$pkgname/$pkgname.png" "$pkgdir/usr/share/pixmaps"
    cp -r "$srcdir/$pkgname/." "$pkgdir/usr/share/games/$_pkgname"
    install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin"  

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
