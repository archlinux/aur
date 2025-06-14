pkgname=mewe
_pkgname=Mewe
pkgver=1.0.7.aurpatch
pkgrel=2
pkgdesc="Unofficial Mewe desktop application."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/mewedesktop"
license=('GPL')
depends=('libelectron>=2025.1' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('db1cfaf98e7ea0b028ef1b77e9e5d2331e6bd2353ab987bc321743e4496c4bcf')


package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps" 
    
    cd "$srcdir/application-$pkgver"
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"   
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  

    # Link to binary  
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
    ln -s "/opt/libelectron/electron" "$pkgdir/opt/$_pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
