pkgname=7plus
_pkgname=7Plus
pkgver=1.0.1
pkgrel=1
pkgdesc="Unofficial 7Plus desktop application."
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/linuxbombay/7plus"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
conflicts=("Stan-bin")
source=("$url/application/-/archive/$pkgver-$pkgrel/application-$pkgver-$pkgrel.tar.bz2")
sha256sums=('e4286ee8e7ceec78abcb512ed4f6d86cf854a083a5314d718777772dfd3f90b5')

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
    ln -s "/opt/$_pkgname/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
