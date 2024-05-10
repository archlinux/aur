pkgname=wolfboa
_pkgname=Wolfboa
pkgver=1.0.0
pkgrel=1
pkgdesc="Wolfenstein: Blade of Agony game powered by the GZDoom."
arch=('x86_64' 'aarch64')
license=('GPL')
url="https://gitlab.com/linuxbombay/wolfboa"
depends=('gzdoom-bin' 'aria2' 'unzip' 'yad')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/wolfboa-$pkgver.tar.bz2")
sha256sums=('9ee49e4a774a6c175b435e37306cca549cb7bc1a6fd8a1000009cded34d10803')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    cp -rf "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin"
    find "$srcdir/$pkgname-$pkgver" -type f \( -name "*.png" \) -exec cp {} "$pkgdir/usr/share/games/$_pkgname" \;
    cp -rf "$srcdir/$pkgname-$pkgver/$pkgname.png" "$pkgdir/usr/share/pixmaps"
    
    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
