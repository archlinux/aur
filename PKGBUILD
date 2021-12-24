pkgname=icytower
_pkgname=IcyTower
pkgver=1.0.0
pkgrel=1
pkgdesc="Harold the Homeboy and his friends have decided to climb a huge tower they found the other day. It's up to you to help them get as high as possible without falling down, and collect extra points by doing cool moves on the way."
arch=('pentium4' 'x86_64')
url=""
license=('GPL')
depends=('wget' 'wine' 'wine-gecko' 'wine-mono' 'unzip' 'zenity')
makedepends=('unzip')
source=("git+https://gitlab.com/icytower/icytower-launch-script")
sha256sums=("SKIP")

package() {
    cd "$srcdir"
    cp -r "$srcdir/icytower-launch-script/." "$srcdir"
    rm -rf "./icytower-launch-script"
    wget -nc "https://gitlab.com/icytower/icytower-binary/1.3.1/-/raw/main/IcyTower.tar.gz"
    install -dm755 "$pkgdir/opt/$_pkgname"
    cp -r ./ "$pkgdir/opt/$_pkgname"  

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
    cp -r "$pkgname.png" "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
