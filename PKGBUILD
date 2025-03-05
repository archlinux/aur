pkgname=doom2
_pkgname=Doom2
pkgver=1.0.1
pkgrel=2
pkgdesc="Doom II first person shooter powered by GZDoom."
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('gzdoom-bin' 'wget' 'unzip' 'yad')
makedepends=('unzip')
source=("https://gitlab.com/linuxbombay/doom2/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('1bb23a4d7884e59ace5bdfea77cdd5eba6076b0bcfe0f162ed3be3366a02b5c8')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    cd $srcdir/$pkgname-$pkgver
    cp "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin"
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
    cp -r $pkgname.svg "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
