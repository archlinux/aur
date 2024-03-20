pkgname=duke3d
_pkgname=Duke3D
pkgver=1.0.2
pkgrel=1
pkgdesc="Duke Nukem 3D developed by ID Software Powered by the Raze engine"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/eduke32-linux"
license=('GPL')
depends=('raze-bin' 'git' 'yad')
makedepends=('unzip')
source=("https://gitlab.com/duke3d/duke3d/-/archive/$pkgver/duke3d-$pkgver.tar.bz2")
sha256sums=('SKIP')

package() {
    install -dm755 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"  
        cd "$srcdir/$pkgname-$pkgver"
        chmod +x $pkgname
        cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
        cp -r "$pkgdir/usr/share/games/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/share/games/$_pkgname/$pkgname" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
