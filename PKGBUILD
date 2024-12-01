pkgname=stan-desktop
_pkgname=Stan-desktop
pkgrlname=stan
_pkgrlname=Stan
pkgver=1.0.7
pkgrel=1
pkgdesc="Unnofficial Stan desktop application"
arch=('x86_64')
url="https://gitlab.com/linuxbombay/stan-desktop"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('f63b13ea4d07fa415fd531ac6aba70cb0d22529ec0d74e3496d5b5644ac5650b')

package() {
    for dir in application-$pkgver ; do mv "${dir}" "$_pkgrlname" ;done
    cd "$srcdir/$_pkgrlname"
    chmod +x $pkgrlname.sh
    ln -sf "/opt/libelectron/node_modules" "$srcdir/$_pkgrlname"
    install -dm755 "$pkgdir/opt/$_pkgrlname"
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
