pkgname=binge
_pkgname=Binge
pkgver=1.0.8.aurpatch
pkgrel=1
pkgdesc="Unnofficial Binge desktop application"
arch=('x86_64')
url="https://gitlab.com/linuxbombay/binge-desktop"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('c123cefe7b3b662851858429702d3353b4893e529c0aeb0ce8526836f313a3b6')


package() {
    cd "$srcdir/application-$pkgver"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps" 


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
