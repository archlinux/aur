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
sha256sums=('a64fb358a31616f443ca68e88eff1c2e4e532e3510ef9c5bc83b1aa2a00354d0')

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
