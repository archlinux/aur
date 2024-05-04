pkgname=abesoddysee-relive
_pkgname=AbesOddysee-relive
pkgver=1.0.0
pkgrel=1
pkgdesc="Oddworld: Abes Oddysee powered by the relive project and will require you to own the game."
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/abesoddysee"
license=('GPL')
depends=('relive-bin' 'unzip')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/abesoddysee-$pkgver.tar.bz2")
sha256sums=("SKIP")

package() {
    install -dm755 "$pkgdir/usr/share/games/AbesOddysee"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/bin"
    
    # Packaging files
     for dir in abesoddysee-$pkgver ; do mv "${dir}" "abesoddysee" ;done
     cd "$srcdir/abesoddysee"
     cp -r ./ "$pkgdir/usr/share/games/AbesOddysee"
     cp -r "$srcdir/abesoddysee/abesoddysee.png" "$pkgdir/usr/share/pixmaps"

    # Link to binary
     install -Dm755 "$srcdir/abesoddysee/abesoddysee" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/abesoddysee/abesoddysee.desktop" \
        "$pkgdir/usr/share/applications/abesoddysee.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/abesoddysee.desktop"
}
