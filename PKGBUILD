pkgname=icytower
_pkgname=IcyTower
pkgver=1.0.1
pkgrel=1
pkgdesc="Harold the Homeboy and his friends have decided to climb a huge tower they found the other day. It's up to you to help them get as high as possible without falling down, and collect extra points by doing cool moves on the way."
arch=('pentium4' 'x86_64')
url=""
license=('GPL')
depends=('wget' 'wine' 'lib32-libpulse' 'unzip' 'yad')
makedepends=('unzip')
source=("https://gitlab.com/icytower/icytower/-/archive/$pkgver-$pkgrel/icytower-$pkgver-$pkgrel.tar.gz")
sha256sums=("SKIP")

package() {
    install -dm755 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    cd "$srcdir/icytower-$pkgver-$pkgrel"
    wget "https://gitlab.com/icytower/Binaries/1.3.1/-/raw/main/IcyTower.tar.gz"
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
    cp -r "$pkgdir/usr/share/games/$_pkgname/$pkgname.png" "$pkgdir/usr/share/pixmaps"

    # Link to binary
    cp -r "$pkgdir/usr/share/games/$_pkgname/icytower" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$pkgdir/usr/share/games/$_pkgname/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
