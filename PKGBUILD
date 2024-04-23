pkgname=cavestory
_pkgname=CaveStory
pkgver=1.0.0
pkgrel=1
pkgdesc="Cave Story powered by the nxengine-evo."
url="https://gitlab.com/linuxbombay/cavestory"
arch=('x86_64' 'i386' 'i686' 'aarch64')
license=('GPL')
depends=('nxengine-evo-bin' 'wget' 'unzip' 'yad')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/cavestory-$pkgver.tar.bz2")
sha256sums=('07162645e3a0916b9bd7cbf1bab89f4120f03865db7e7cabc3cb11879cd2f275')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    # Check if otr files exists so it doesn't redownload the files when it doesn't need to.
        FILE="/usr/share/games/$_pkgname/config.dat"
     if test -f "$FILE"
    then
        echo "$FILE exists skipping download."
        cp -rf "/usr/share/games/$_pkgname/." "$srcdir/$pkgname-$pkgver"
    else
        echo "$file does not exist, starting download.."
        cd $srcdir
        wget "https://www.cavestory.org/downloads/cavestoryen.zip"
        unzip -o cavestoryen.zip -d $srcdir
    fi
    cp "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin"
    cp -rf "$srcdir/$pkgname-$pkgver/"* "$pkgdir/usr/share/games/$_pkgname"
    cp -rf "$srcdir/CaveStory/"* "$pkgdir/usr/share/games/$_pkgname"
    cp "$srcdir/$pkgname-$pkgver/$pkgname.png" "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
