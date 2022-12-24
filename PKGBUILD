pkgname=7plus
_pkgname=7Plus
pkgver=1.0.0
pkgrel=3
pkgdesc="Unofficial 7Plus desktop application."
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/7plus/application"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
conflicts=("Stan-bin")
source=("https://gitlab.com/7plus/application/-/archive/$pkgver-$pkgrel/application-$pkgver-$pkgrel.tar.bz2")
sha256sums=('SKIP')

package() {
        for dir in application-$pkgver-$pkgrel ; do mv "${dir}" "$_pkgname" ;done
    cd "$srcdir/$_pkgname"
    chmod +x $_pkgname.sh
    ln -sf "/opt/libelectron/node_modules" "$srcdir/$_pkgname"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
