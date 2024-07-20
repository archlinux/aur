pkgname=twitter
_pkgname=Twitter
pkgver=1.0.5
pkgrel=1
pkgdesc="Unnofficial Twitter desktop application"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/twitterdesktop/application"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("https://gitlab.com/linuxbombay/twitterdesktop/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('07a1e7a62990b3c5230802a595fd676dfa29545ab28d14b01eb08f98c09bf1e7')


package() {
    for dir in application-$pkgver ; do mv "${dir}" "$_pkgname" ;done
    cd "$srcdir/$_pkgname"
    chmod +x $pkgname.sh
    ln -sf "/opt/libelectron/node_modules" "$srcdir/$_pkgname"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname-icon.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
