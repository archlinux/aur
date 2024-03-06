pkgname=duke3d
_pkgname=Duke3D
pkgver=1.0.0
pkgrel=1
pkgdesc="Duke Nukem 3D developed by ID Software Powered by the EDuke32"
arch=('x86_64' 'i686' 'pentium4' 'aarch64')
url="https://gitlab.com/eduke32-linux"
license=('GPL')
depends=('eduke32-bin' 'git' 'yad')
makedepends=('unzip')
source=("https://gitlab.com/eduke32-linux/duke3d/-/archive/$pkgver-$pkgrel/duke3d-$pkgver-$pkgrel.tar.bz2")
sha256sums=('SKIP')

package() {
    install -dm755 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"  
        cd "$srcdir/$pkgname-$pkgver-$pkgrel"
        chmod +x $pkgname
        cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
        cp -r "$pkgdir/usr/share/games/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/share/games/$_pkgname/$pkgname" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgrel/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
