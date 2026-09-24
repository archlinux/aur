pkgname=icytower
_pkgname=IcyTower
pkgver=1.3.1
pkgrel=1
scriptver=1.3
pkgdesc="Harold the Homeboy and his friends have decided to climb a huge tower they found the other day. It's up to you to help them get as high as possible without falling down, and collect extra points by doing cool moves on the way."
arch=('pentium4' 'x86_64')
url="https://gitlab.com/linuxbombay/icytower"
license=('GPL')
depends=('wget' 'wine' 'lib32-libpulse' 'unzip' 'zenity')
makedepends=('unzip')
source=("$url/icytower/-/archive/$scriptver/icytower-$scriptver.tar.bz2" "$url/Binaries/$pkgver/-/raw/main/IcyTower.tar.gz")
sha256sums=('be436087991f5ac398334a61877a5f07f2d54d9a065c11819077cb25ec167281'
            'e396047c6d8d3ed8e0f3d358c50d5b779edfc10911fac79f8f7ea254d62ac9ee')
package() {
    install -d -m755 "$pkgdir/usr/share/games/$_pkgname"
    install -d -m755 "$pkgdir/usr/bin"
    install -d -m755 "$pkgdir/usr/share/pixmaps"


    #cd ""
    cp -r "$srcdir/icytower-$scriptver/." "$pkgdir/usr/share/games/$_pkgname/"
    cd "$srcdir"
    rm -rf "$srcdir/icytower-*" "$srcdir/IcyTower.tar.gz" "$srcdir/icytower-$scriptver.tar.bz2"
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname/"
    cp -r "$pkgdir/usr/share/games/$_pkgname/$pkgname.png" "$pkgdir/usr/share/pixmaps"

    # Link to binary
    cp -r "$pkgdir/usr/share/games/$_pkgname/icytower" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$pkgdir/usr/share/games/$_pkgname/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

