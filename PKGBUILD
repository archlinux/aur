pkgname=7plus
_pkgname=7Plus
pkgver=1.0.2
pkgrel=1
pkgdesc="Unofficial 7Plus desktop application."
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/linuxbombay/7plus"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('3de19bb0d6afa7e60c903ed81a6d330848777507e99390f64801b02e82b38e2f')

package() {
    for dir in application-$pkgver ; do mv "${dir}" "$_pkgname" ;done
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
