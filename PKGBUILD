pkgname=doom
_pkgname=Doom
pkgver=1.0.1
pkgrel=1
pkgdesc="Original Doom first person shooter powered by GZDoom."
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('gzdoom-bin' 'wget' 'unzip' 'yad')
makedepends=('unzip')
source=("https://gitlab.com/linuxbombay/doom/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('b43cea68deffc19dd36c850f8af64215b5cf7b972369bffd5f06af0c7ee66678')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files 
    cd $srcdir/$pkgname-$pkgver
    cp "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin"
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
    cp -r doom1.svg "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
