pkgname=stan-desktop
_pkgname=Stan-desktop
pkgrlname=stan
_pkgrlname=Stan
pkgver=1.0.2
pkgrel=2
pkgdesc="Unnofficial Stan desktop application"
arch=('x86_64')
url="https://gitlab.com/Stan-desktop/application"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
conflicts=("Stan-bin")
source=("https://gitlab.com/Stan-desktop/application/-/archive/$pkgver-$pkgrel/application-$pkgver-$pkgrel.tar.bz2")
sha256sums=('SKIP')

package() {
    for dir in application-$pkgver-$pkgrel ; do mv "${dir}" "$_pkgrlname" ;done
    cd "$srcdir/$_pkgrlname"
    chmod +x $pkgrlname.sh
    ln -sf "/opt/libelectron/node_modules" "$srcdir/$_pkgrlname"
    install -dm755 "$pkgdir/opt/$pkgrlname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgrlname"
    cp -r "$pkgdir/opt/$_pkgrlname/$pkgrlname.svg" "$pkgdir/usr/share/pixmaps"  

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgrlname/$pkgrlname.sh" "$pkgdir/usr/bin/$pkgrlname"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgrlname/$_pkgrlname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgrlname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgrlname.desktop"
}
